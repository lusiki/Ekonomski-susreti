"""Build the illustrated lecture speaking guide. See materials/speaking-guide/README.md."""
from pathlib import Path
from xml.sax.saxutils import escape
from urllib.parse import quote
import json,re
from reportlab.pdfgen import canvas
from reportlab.lib.pagesizes import A4
from reportlab.lib.colors import HexColor, black
from reportlab.platypus import Paragraph
from reportlab.lib.styles import ParagraphStyle
from reportlab.pdfbase import pdfmetrics
from reportlab.pdfbase.ttfonts import TTFont
from reportlab.lib.utils import ImageReader

import argparse
import fitz
from bs4 import BeautifulSoup

ROOT = Path(__file__).resolve().parents[1]
parser = argparse.ArgumentParser(description='Build the Day 1 speaking guide from the current lecture PDF and speaking cards.')
parser.add_argument('--output', type=Path, default=ROOT/'docs/downloads/Govorni-vodic-izlaganje.pdf')
parser.add_argument('--work-dir', type=Path, default=ROOT/'work/speaking-guide')
args = parser.parse_args()
P = args.work_dir.resolve()
(P/'previews').mkdir(parents=True, exist_ok=True)
args.output.parent.mkdir(parents=True, exist_ok=True)
T = json.loads((ROOT/'materials/speaking-guide/lecture.json').read_text(encoding='utf-8'))
soup = BeautifulSoup((ROOT/'docs/slides/index.html').read_text(encoding='utf-8'), 'html.parser')
TM = [{'id': s['id'], 'title': s.select_one('h1,h2').get_text(' ', strip=True)} for s in soup.select('section.page')]
with fitz.open(ROOT/'docs/downloads/Ekonomski-susreti.pdf') as deck:
    assert len(deck) == len(TM) == len(T), 'Regenerate the lecture PDF before building its speaking guide.'
    assert [card['slides'] for card in T] == [[n] for n in range(1, len(TM)+1)]
    for n, page in enumerate(deck, 1):
        page.get_pixmap(matrix=fitz.Matrix(1.3, 1.3)).save(P/'previews'/f'talk-{n:02}.png')
for face in ('Regular','Light','Medium','Bold','Italic'):
 pdfmetrics.registerFont(TTFont('Roboto'+face,str(ROOT/'docs/fonts'/f'Roboto-{face}.ttf')))
pdfmetrics.registerFontFamily('RobotoRegular',normal='RobotoRegular',bold='RobotoBold',italic='RobotoItalic',boldItalic='RobotoBold')
# Courier is a built-in PDF font; no system-specific font path is needed.
WIDTH,HEIGHT=A4; M=46; CW=WIDTH-2*M
GRAY=HexColor('#555555');RULE=HexColor('#d9d9d9')
styles={
 'body':ParagraphStyle('body',fontName='RobotoRegular',fontSize=12.6,leading=17.3,textColor=black,spaceAfter=9),
 'small':ParagraphStyle('small',fontName='RobotoRegular',fontSize=10.5,leading=14.4,textColor=GRAY),
 'cue':ParagraphStyle('cue',fontName='RobotoRegular',fontSize=11.3,leading=15.3,textColor=black),
 'title':ParagraphStyle('title',fontName='RobotoLight',fontSize=23,leading=27),
 'h3':ParagraphStyle('h3',fontName='RobotoMedium',fontSize=13,leading=17),
 'code':ParagraphStyle('code',fontName='Courier',fontSize=10.3,leading=14.5),
}

def clean(t):
 return t.replace('\\n','\n').replace('–','-').replace('—','-').replace('−','-').replace('\u2011','-')
def markup(t):
 t=escape(clean(t));return re.sub(r'`([^`]+)`',r'<font name="Courier">\1</font>',t).replace('\n','<br/>')

class PDF:
 def __init__(self,path,day,name,total):
  self.c=canvas.Canvas(str(path),pagesize=A4,pageCompression=1);self.c.setTitle(name);self.c.setAuthor('Luka Sikić');self.day=day;self.name=name;self.total=total;self.n=0;self.minimum=HEIGHT;self.audit=[]
 def para(self,t,x,y,w=CW,style='body'):
  p=Paragraph(markup(t),styles[style]);_,h=p.wrap(w,1000)
  assert y-h>=49,f'Page {self.n} overflow: {t[:80]} bottom {y-h}'
  p.drawOn(self.c,x,y-h);self.minimum=min(self.minimum,y-h);return y-h
 def label(self,t,y,x=M):
  self.c.setFillColor(GRAY);self.c.setFont('RobotoBold',8.1);self.c.drawString(x,y,clean(t.upper()));return y-14
 def start(self,kicker,title,key):
  self.n+=1; self.minimum=HEIGHT
  self.c.bookmarkPage(key);self.c.addOutlineEntry(clean(title),key,0,False)
  self.c.setStrokeColor(black);self.c.setLineWidth(.6);self.c.line(M,HEIGHT-39,WIDTH-M,HEIGHT-39)
  self.c.setFillColor(GRAY);self.c.setFont('RobotoBold',8.2);self.c.drawString(M,HEIGHT-55,clean(kicker.upper()))
  return self.para(title,M,HEIGHT-76,style='title')-18
 def finish(self):
  self.c.setStrokeColor(RULE);self.c.setLineWidth(.6);self.c.line(M,39,WIDTH-M,39)
  self.c.setFont('RobotoRegular',8);self.c.setFillColor(GRAY);self.c.drawString(M,25,f'EKONOMSKI SUSRETI 2026  /  DAN {self.day}  /  GOVORNI VODIČ')
  self.c.drawRightString(WIDTH-M,25,f'{self.n:02} / {self.total:02}')
  self.audit.append({'page':self.n,'lowest_content_y':round(self.minimum,1)})
  self.c.showPage()
 def image(self,path,x,y,w):
  image=ImageReader(str(path));iw,ih=image.getSize();h=w*ih/iw
  self.c.drawImage(image,x,y-h,width=w,height=h,mask='auto');self.c.setStrokeColor(RULE);self.c.setLineWidth(.4);self.c.rect(x,y-h,w,h,stroke=1,fill=0)
  return y-h
 def block(self,label,text,y,style='cue'):
  y=self.label(label,y);return self.para(text,M,y,style=style)-13
 def link(self,text,url,y):
  self.c.setFont('RobotoRegular',10.3);self.c.setFillColor(black);self.c.drawString(M,y,clean(text));w=pdfmetrics.stringWidth(clean(text),'RobotoRegular',10.3);self.c.setStrokeColor(HexColor('#c8102e'));self.c.line(M,y-3,M+w,y-3);self.c.linkURL(url,(M,y-4,M+w,y+12),relative=0);return y-23
 def save(self):
  assert self.n==self.total,(self.n,self.total)
  self.c.save();return self.audit

def cover(d,title,subtitle,image,summary,link):
 y=d.start(f'Dan {d.day} · osobni primjerak za izlagača',title,'cover')
 y=d.para(subtitle,M,y,style='h3')-25
 y=d.image(image,M,y,CW)-25
 y=d.para(summary,M,y,style='body')-22
 y=d.block('Kako se koristiti vodičem','Na ekranu vas podsjeća što publika vidi. Recite donosi govornu osnovu. Pokažite / napravite i Prijelaz vode izvedbu. Napomene Samo za vas ne treba čitati publici.',y)
 y=d.block('Ritam','Vrijeme je orijentir za govor, pokazivanje, stanke i kratke odgovore. Tekst nije stenogram koji morate pročitati od riječi do riječi. Minijature prikazuju sve otkrivene dijelove slajda.',y,style='small')
 d.link('Otvori pripadajuće slajdove',link,y)
 d.finish()

def rows(d,rows,y,widths=(90,150,263)):
 for left,mid,right in rows:
  tops=[];x=M
  for t,w in zip((left,mid,right),widths):tops.append(d.para(t,x,y,w-12,'small'));x+=w
  y=min(tops)-12;d.c.setStrokeColor(RULE);d.c.line(M,y+5,WIDTH-M,y+5)
 return y-10

def card(d,entry,meta,prefix):
 nums=entry['slides']; last=nums[-1];title=meta[last-1]['title']; label='Slajd '+str(last) if len(nums)==1 else 'Slajdovi '+', '.join(map(str,nums))
 y=d.start(f'{label} / {len(meta)} · {entry["time"]}',title,f'slide-{last}')
 top=y; tw=264; tx=WIDTH-M-tw; lw=CW-tw-20
 bottom=d.image(P/'previews'/f'talk-{last:02}.png',tx,top,tw)
 sy=d.label('Na ekranu',top-2);sy=d.para(entry['show'],M,sy,lw,'small')
 if len(nums)>1:
  sy-=12;d.image(P/'previews'/f'{prefix}-{nums[0]:02}.png',M,sy,104)
  sy-=58.5; d.minimum=min(d.minimum,sy)
 # Link the thumbnail to the corresponding live slide.
 url='https://lusiki.github.io/Ekonomski-susreti/slides/#/'+quote(meta[last-1]['id'])
 d.c.linkURL(url,(tx,bottom,tx+tw,top),relative=0)
 y=min(bottom,sy)-22
 y=d.label('Recite',y)
 for para in clean(entry['say']).split('\n\n'):
  y=d.para(para,M,y,style='body')-8
 y-=3;y=d.block('Pokažite / napravite',entry['action'],y)
 y=d.block('Prijelaz',entry['bridge'],y)
 if entry.get('care'):y=d.block('Samo za vas',entry['care'],y,style='small')
 # Leave subtle ruled space when a card has room for handwritten additions.
 if y>105:
  d.c.setStrokeColor(RULE)
  for yy in (83,64):d.c.line(M,yy,WIDTH-M,yy)
 d.finish()


D=PDF(args.output,1,'Govorni vodič · Kada inflacija istisne glas središnje banke',len(T)+3)
cover(D,'Kada inflacija istisne\nglas središnje banke','Istraživačko izlaganje · 20-25 minuta · 24 slajda',P/'previews/talk-01.png',
 'Vodič prati put od mjesečnih grafikona medijske zastupljenosti preko odnosa inflacije, jaza i očekivanja do praktičnih pitanja o komunikaciji. Svaki slajd ima govornu osnovu i prijelaz na sljedeću temu.',
 'https://lusiki.github.io/Ekonomski-susreti/slides/')
y=D.start('Prije izlaska pred publiku','Cijela priča na jednoj stranici','route')
y=D.para('Više objava ne mora značiti veći dio razgovora.',M,y,style='h3')-22
y=rows(D,[('00-04','Slajdovi 1-6','Motivacija, pitanja, korpus i mjera.'),('04-07:55','Slajdovi 7-12','Mjesečne putanje i godišnji pregled.'),('07:55-14:20','Slajdovi 13-19','Jaz, metode, nalazi i provjere.'),('14:20-17:50','Slajdovi 20-23','Tumačenje, komunikacija i otvorena pitanja.'),('17:50-20','Slajd 24','Zatvaranje i početak rasprave.')],y)
y=D.block('Tri mjesta za stanku','Na slajdu 2 nakon više objava i manjeg udjela. Na slajdu 13 objasnite zašto manji udio znači veći jaz. Na slajdu 17 odvojite predviđanje od uzročnog zaključka.',y)
y=D.block('Brojke za pamćenje','68 mjeseci, 124.163 institucionalne i 65.530 relevantnih objava. Tjedni model daje 0,00213 jedinica jaza po bodu inflacije, uz kontrolu obujma. Relativna učestalost niža je za oko 0,47 postotnih bodova.',y)
y=D.block('Ritam izvedbe','Kartice daju sažetu 20-minutnu putanju. Za mirnije objašnjenje modela i dodatna pitanja predvidite 25 minuta. Metodološku tablicu i provjere prođite kratko. Ne ubrzavajte objašnjenje osi.',y)
y=D.block('Jedinice i razdoblja','Svaki deskriptivni stupac je mjesec, od siječnja 2021. do kolovoza 2026. Procjene modela obuhvaćaju 2021.–2023. Os grafa očekivanja prikazuje horizonte u tjednima.',y)
D.finish()
for e in T:card(D,e,TM,'talk')
y=D.start('Nakon posljednjeg slajda','Kratki odgovori za raspravu','questions')
for q,a in [
 ('Što obuhvaća korpus?','HNB i generičke izraze za središnje banke u digitalnim objavama, uključujući dio društvenih objava i komentara. Prikazujemo 68 potpunih mjeseci. Godina 2026. obuhvaća siječanj do kolovoza.'),
 ('Kako se računa ponderirani udio?','Potencijalni doseg relevantnih objava ponderiramo istaknutošću institucije i dijelimo dosegom inflacijskog korpusa, uz +1 u nazivniku. Godišnji udio računamo iz zbrojeva, a ne kao prosjek mjesečnih postotaka.'),
 ('Zašto više objava može značiti manji udio?','Ako se ukupna rasprava širi brže od institucionalnog sadržaja, broj relevantnih objava može rasti dok njihov udio pada. Potencijalni doseg pritom nije stvarna čitanost.'),
 ('Što znači 0,0021?','Zaokruženi tjedni koeficijent 0,00213 uz kontrolu obujma. Jedan postotni bod viša inflacija povezana je s oko 0,21 postotnim bodom većeg jaza. Procjena se odnosi na 2021.–2023. i 157 opažanja.'),
 ('Kako čitati nalaz o očekivanjima?','To je prediktivna veza u promatranom uzorku. Linearno mapiranje prolazi Bonferronijevu korekciju na testiranim horizontima od 2. do 12. tjedna. Stepenasto ne prolazi na 10. i 12. tjednu, pa nalaz ovisi o načinu mapiranja.'),
 ('Je li rezultat uzročan?','Osnovni modeli opisuju uvjetnu povezanost. IV tumačenje ovisi o pretpostavci da instrumenti ne djeluju na jaz drugim kanalima. Chowov test pokazuje promjenu odnosa oko određenog datuma, a sam ne identificira učinak eura.')]:
    y=D.para(q,M,y,style='h3')-5;y=D.para(a,M,y,style='small')-14
y=D.link('Slajdovi i materijali izlaganja','https://lusiki.github.io/Ekonomski-susreti/',y-4)
y=D.para('Vodič prati 24 slajda. Minijature i naslovi preuzimaju se iz prezentacije pri izradi dokumenta. Govorna osnova može se prilagoditi tempu izlaganja.',M,y,style='small')
D.finish()
(P/'layout-audit.json').write_text(json.dumps(D.save(),indent=2),encoding='utf-8')
print(f'Saved {len(T)+3}-page speaking guide: {args.output}')
