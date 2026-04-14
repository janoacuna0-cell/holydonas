$path = "index.html"
$content = [System.IO.File]::ReadAllText($path)

$startIndex = $content.IndexOf("<style>")
$endIndex = $content.IndexOf("</style>")
if ($startIndex -eq -1 -or $endIndex -eq -1) {
    Write-Host "Style tags not found."
    exit
}

$newStyle = @"
<style>
*,*::before,*::after{margin:0;padding:0;box-sizing:border-box;}
:root{
  --bg:#FFF5D1;--bg2:#FFEAB5;--bg3:#FFF9E6;
  --orange:#E85D22;--red:#C83000;--gold:#FFB30F;--green:#25D366;
  --text-dark:#2D1A12;--white:#FFFFFF;--grey:#887766;--card:#FFFFFF;
  --border:#E85D22;
  --ease:cubic-bezier(.23,1,.32,1);
  --spring:cubic-bezier(.34,1.56,.64,1);
  --font-d:"Anton",sans-serif;--font-h:"Bebas Neue",sans-serif;--font-b:"DM Sans",sans-serif;
}
html{scroll-behavior:smooth;overflow-x:hidden;}
body{background:var(--bg);color:var(--text-dark);font-family:var(--font-b);overflow-x:hidden;}
a{text-decoration:none;color:inherit;}
img{display:block;max-width:100%;}
button{cursor:pointer;font-family:var(--font-b);}
::-webkit-scrollbar{width:6px;}
::-webkit-scrollbar-track{background:var(--bg);}
::-webkit-scrollbar-thumb{background:var(--orange);border-radius:3px;}

/* NAV */
nav{position:fixed;top:0;left:0;right:0;z-index:500;padding:16px 52px;display:flex;align-items:center;justify-content:space-between;background:var(--bg3);transition:all .4s var(--ease); box-shadow:0 2px 10px rgba(0,0,0,0.05);}
nav.sc{background:rgba(255,249,230,.95);backdrop-filter:blur(8px);padding:11px 52px;border-bottom:3px solid var(--orange);}
.nav-brand{display:flex;flex-direction:column;line-height:1;}
.nav-brand-name{font-family:var(--font-d);font-size:1.6rem;letter-spacing:1px;color:var(--red);text-shadow: 2px 2px 0px var(--gold);}
.nav-brand-tag{font-size:.65rem;letter-spacing:1px;text-transform:uppercase;color:var(--orange);margin-top:1px;font-weight:bold;}
.nav-links{display:flex;gap:30px;list-style:none;}
.nav-links a{font-size:.8rem;font-weight:bold;letter-spacing:1px;text-transform:uppercase;color:var(--text-dark);position:relative;transition:color .25s;}
.nav-links a::after{content:"";position:absolute;bottom:-4px;left:0;width:0;height:2px;background:var(--orange);transition:width .3s var(--ease);}
.nav-links a:hover{color:var(--red);}
.nav-links a:hover::after{width:100%;}
.nav-right{display:flex;align-items:center;gap:13px;}
.nav-clock{display:flex;align-items:center;gap:7px;background:var(--white);border:2px solid var(--orange);border-radius:8px;padding:5px 11px;}
.clk-t{font-family:var(--font-d);font-size:1.1rem;letter-spacing:1px;color:var(--text-dark);}
.clk-b{font-size:.52rem;font-weight:800;letter-spacing:1px;text-transform:uppercase;padding:3px 6px;border-radius:4px;transition:all .4s;}
.clk-b.open{background:#25D366;color:#FFF;}
.clk-b.closed{background:var(--red);color:#FFF;}
.cart-btn{position:relative;display:flex;align-items:center;gap:7px;background:var(--orange);color:#FFF;font-family:var(--font-h);font-size:1.1rem;letter-spacing:1px;padding:8px 16px;border:none;border-radius:8px;transition:transform .18s var(--ease); box-shadow: 3px 3px 0px var(--red);}
.cart-btn:hover{transform:translateY(-2px);box-shadow:4px 4px 0px var(--red);}
.cart-btn svg{width:18px;height:18px;fill:none;stroke:currentColor;stroke-width:2.2;}
.cart-bdg{position:absolute;top:-8px;right:-8px;background:var(--red);color:#fff;font-family:var(--font-b);font-size:.7rem;font-weight:800;min-width:22px;height:22px;border-radius:11px;display:none;align-items:center;justify-content:center;padding:0 4px;transition:transform .3s var(--spring); border:2px solid #FFF;}
.cart-bdg.show{display:flex;}
.cart-bdg.bump{animation:bBump .4s var(--spring);}
@keyframes bBump{0%,100%{transform:scale(1);}50%{transform:scale(1.65);}}
.ham{display:none;flex-direction:column;gap:5px;background:none;border:none;padding:4px;}
.ham span{display:block;width:23px;height:3px;background:var(--red);border-radius:2px;}
.mdr{position:fixed;inset:0;background:var(--bg2);z-index:490;display:flex;flex-direction:column;align-items:center;justify-content:center;gap:28px;opacity:0;pointer-events:none;transition:opacity .35s var(--ease);}
.mdr.open{opacity:1;pointer-events:all;}
.mdr a{font-family:var(--font-d);font-size:3rem;letter-spacing:1px;text-transform:uppercase;color:var(--red);text-shadow: 2px 2px 0px var(--gold);transition:transform .2s;}
.mdr a:hover{transform:scale(1.05);}
.mdr-x{position:absolute;top:20px;right:26px;background:none;border:none;color:var(--text-dark);font-size:2rem;font-weight:bold;}

/* HERO */
#hero{position:relative;width:100%;height:100vh;min-height:600px;display:flex;align-items:center;justify-content:center;overflow:hidden;background: radial-gradient(circle at 50% 50%, var(--bg2) 0%, var(--bg) 100%);}
.hero-content{position:relative;z-index:2;text-align:center;display:flex;flex-direction:column;align-items:center;padding:0 32px;max-width:780px;}
.h-ey{font-size:.8rem;font-weight:800;letter-spacing:3px;text-transform:uppercase;color:var(--orange);margin-bottom:15px;display:block;opacity:0;animation:fuA .8s .15s var(--ease) forwards;}
.h-title{font-family:var(--font-d);font-size:clamp(4.2rem,10.5vw,10rem);line-height:.9;letter-spacing:2px;text-transform:uppercase;color:var(--red);text-shadow: 4px 4px 0px var(--gold); opacity:0;animation:fuA .95s .3s var(--ease) forwards;margin-bottom:16px;}
.h-sub{font-family:var(--font-h);font-size:clamp(1.5rem,3.2vw,2.5rem);letter-spacing:2px;color:var(--text-dark);text-transform:uppercase;opacity:0;animation:fuA .8s .5s var(--ease) forwards;margin-bottom:10px;}
.h-sub em{color:var(--orange);font-style:normal; font-size:1.2em;}
.h-meta{font-size:.8rem;font-weight:600;color:var(--grey);letter-spacing:1px;margin-bottom:38px;opacity:0;animation:fuA .8s .66s var(--ease) forwards;}
.h-meta strong{color:var(--red);}
.h-acts{display:flex;gap:16px;flex-wrap:wrap;justify-content:center;opacity:0;animation:fuA .8s .82s var(--ease) forwards;}
@keyframes fuA{from{opacity:0;transform:translateY(22px);}to{opacity:1;transform:none;}}
@keyframes fiA{from{opacity:0;}to{opacity:1;}}
.scue{position:absolute;bottom:26px;left:50%;transform:translateX(-50%);z-index:2;display:flex;flex-direction:column;align-items:center;gap:7px;opacity:0;animation:fiA 1s 2.2s forwards;}
.scue span{font-size:.65rem;font-weight:bold;letter-spacing:2px;text-transform:uppercase;color:var(--orange);}
.scue-line{width:2px;height:38px;background:var(--orange);animation:scP 2s ease-in-out infinite;}
@keyframes scP{0%,100%{transform:scaleY(0.7);opacity:.5;}50%{transform:scaleY(1);opacity:1;}}

/* BUTTONS */
.btn-p{display:inline-flex;align-items:center;gap:9px;background:var(--orange);color:#FFF;font-size:.9rem;font-family:var(--font-h);letter-spacing:1px;text-transform:uppercase;padding:14px 30px;border-radius:12px;border:none;transition:transform .18s var(--ease);box-shadow:4px 4px 0px var(--red);}
.btn-p:hover{transform:translateY(-2px);box-shadow:6px 6px 0px var(--red);}
.btn-p svg{width:18px;height:18px;fill:currentColor;}
.btn-s{display:inline-flex;align-items:center;gap:9px;background:var(--white);color:var(--red);font-size:.9rem;font-weight:bold;font-family:var(--font-h);letter-spacing:1px;text-transform:uppercase;padding:12px 28px;border-radius:12px;border:3px solid var(--red);transition:transform .18s var(--ease);box-shadow:4px 4px 0px var(--orange);}
.btn-s:hover{transform:translateY(-2px);box-shadow:6px 6px 0px var(--orange);}

/* STATS */
.stats-bar{background:var(--gold);border-top:4px solid var(--red);border-bottom:4px solid var(--red);padding:24px 52px;display:flex;align-items:center;justify-content:space-around;flex-wrap:wrap;gap:14px;}
.stat-it{text-align:center;color:var(--red);}
.stat-n{font-family:var(--font-d);font-size:2.5rem;line-height:1;display:block;text-shadow: 2px 2px 0px var(--white);}
.stat-l{font-size:.7rem;letter-spacing:1px;text-transform:uppercase;font-weight:800;color:var(--text-dark);}
.stat-dv{width:3px;height:36px;background:var(--red);border-radius:2px;}

/* MARQUEE */
.mq{overflow:hidden;border-top:3px solid var(--orange);border-bottom:3px solid var(--orange);padding:.8rem 0;background:var(--red);}
.mq-t{display:inline-flex;gap:2.5rem;animation:mq 22s linear infinite;font-family:var(--font-h);font-size:1.1rem;letter-spacing:2px;color:#FFF;white-space:nowrap;}
.mq-t.rev{animation-direction:reverse;background:var(--orange);color:var(--bg3);border:none;}
@keyframes mq{to{transform:translateX(-50%);}}
.mq-t span{padding:0 .3rem;}
.mdot{color:var(--gold);}

/* SECTIONS */
.sw{padding:100px 52px;max-width:1360px;margin:0 auto;}
.sec-lbl{font-size:.8rem;font-weight:800;letter-spacing:2px;text-transform:uppercase;color:var(--orange);margin-bottom:9px;display:block;}
.sec-title{font-family:var(--font-d);font-size:clamp(3rem,6vw,5rem);line-height:.95;color:var(--red);text-transform:uppercase;margin-bottom:12px;text-shadow: 3px 3px 0px var(--gold);}
.sec-title span{color:var(--orange);text-shadow: 3px 3px 0px var(--white);}
.sec-desc{font-size:1rem;color:var(--grey);font-weight:500;max-width:500px;line-height:1.75;}
.reveal{opacity:0;transform:translateY(28px);transition:opacity .75s var(--ease),transform .75s var(--ease);}
.reveal.vis{opacity:1;transform:none;}

/* MENU */
#menu-sec{background:var(--bg2);}
.mtabs{display:flex;border-bottom:3px solid var(--orange);margin-bottom:44px;overflow-x:auto;scrollbar-width:none;}
.mtabs::-webkit-scrollbar{display:none;}
.mtab{font-family:var(--font-h);font-size:1.2rem;letter-spacing:1px;text-transform:uppercase;color:var(--grey);padding:12px 24px;border:none;background:none;cursor:pointer;white-space:nowrap;position:relative;border-bottom:4px solid transparent;margin-bottom:-3px;transition:color .22s;}
.mtab.act{color:var(--red);}
.mtab.act::after{content:"";position:absolute;bottom:-3px;left:0;right:0;height:4px;background:var(--red);border-radius:2px;}
.mtab:hover{color:var(--orange);}
.mpanel{display:none;}
.mpanel.act{display:block;}
.mgrid{display:grid;grid-template-columns:repeat(auto-fill,minmax(260px,1fr));gap:24px;}

/* CARD */
.mc{background:var(--card);border:3px solid var(--border);border-radius:16px;overflow:hidden;transition:transform .2s var(--spring);cursor:pointer;position:relative;display:flex;flex-direction:column;box-shadow: 5px 5px 0px var(--orange);}
.mc:hover{transform:translateY(-6px);box-shadow: 8px 8px 0px var(--red);border-color:var(--red);}
.mc-img-wrap{position:relative;width:100%;padding-top:60%;overflow:hidden;background:var(--bg3);cursor:pointer;border-bottom:3px solid var(--border);}
.mc-img{position:absolute;inset:0;width:100%;height:100%;object-fit:cover;transition:transform .4s var(--ease);}
.mc:hover .mc-img{transform:scale(1.08);}
.mc-view{position:absolute;bottom:12px;left:50%;transform:translateX(-50%) translateY(20px);font-family:var(--font-h);font-size:.9rem;letter-spacing:1px;text-transform:uppercase;background:var(--red);color:#FFF;padding:6px 16px;border-radius:20px;white-space:nowrap;opacity:0;transition:opacity .2s,transform .2s;z-index:2;box-shadow: 2px 2px 0px var(--gold);}
.mc:hover .mc-view{opacity:1;transform:translateX(-50%) translateY(0);}
.mc-badge{position:absolute;top:12px;right:12px;background:var(--gold);color:var(--text-dark);font-family:var(--font-h);font-size:.9rem;letter-spacing:1px;text-transform:uppercase;padding:4px 10px;border-radius:8px;z-index:2;border:2px solid var(--text-dark);}
.mc-body{padding:20px;display:flex;flex-direction:column;gap:5px;flex:1;}
.mc-name{font-family:var(--font-d);font-size:1.4rem;letter-spacing:1px;text-transform:uppercase;color:var(--red);}
.mc-desc{font-size:.85rem;color:var(--grey);line-height:1.5;flex:1;font-weight:500;}
.mc-bot{margin-top:16px;display:flex;flex-direction:column;gap:12px;}
.mc-prices{display:flex;gap:12px;align-items:center;}
.ptag{display:flex;flex-direction:column;align-items:center; background:var(--bg3); padding:4px 10px; border-radius:8px; border:2px solid var(--orange);}
.ptag .pl{font-size:.65rem;font-weight:bold;letter-spacing:1px;text-transform:uppercase;color:var(--orange);margin-bottom:1px;}
.ptag .pv{font-family:var(--font-d);font-size:1.2rem;color:var(--red);}
.pdv{width:2px;height:24px;background:var(--orange);}
.mc-price{font-family:var(--font-d);font-size:1.5rem;color:var(--red);}
.add-btn{display:flex;align-items:center;justify-content:center;gap:7px;background:var(--red);color:#fff;font-family:var(--font-h);font-size:1.1rem;letter-spacing:1px;padding:12px;border:none;border-radius:10px;transition:transform .2s var(--spring);box-shadow:3px 3px 0px var(--gold);}
.add-btn:hover{transform:scale(1.02);box-shadow:4px 4px 0px var(--gold);}
.add-btn:active{transform:scale(.97);}
.add-btn svg{width:18px;height:18px;fill:currentColor;flex-shrink:0;}

/* NOSOTROS */
.nos-grid{display:grid;grid-template-columns:1fr 1fr;gap:60px;align-items:center;}
.exp-wrap{position:relative;width:100%;max-width:420px;height:500px;margin:0 auto;}
.exp-inner{position:relative;width:100%;height:100%;perspective:900px;}
.exp-tilt{width:100%;height:100%;transform-style:preserve-3d;transition:transform .28s var(--ease);}
.exp-layer{position:absolute;left:50%;transform:translateX(-50%) translateY(-120px);opacity:0;transition:transform .5s var(--ease),filter .28s;display:flex;flex-direction:column;align-items:center;}
.exp-layer.in{animation:elIn .7s var(--ease) forwards;}
@keyframes elIn{
  0%{opacity:0;transform:translateX(-50%) translateY(-100px) scaleX(1.05);}
  50%{opacity:1;transform:translateX(-50%) translateY(6px) scaleX(.98);}
  75%{transform:translateX(-50%) translateY(-3px) scaleX(1.005);}
  100%{opacity:1;transform:translateX(-50%) translateY(0) scaleX(1);}
}
.el-bb{width:90%;bottom:0;}
.el-p1{width:78%;bottom:10%;}
.el-ch{width:85%;bottom:18%;}
.el-p2{width:78%;bottom:26%;}
.el-lt{width:92%;bottom:33%;}
.el-tm{width:72%;bottom:41%;}
.el-sc{width:80%;bottom:48%;}
.el-bt{width:86%;bottom:55%;}
.exp-wrap:hover .exp-layer{filter:drop-shadow(0 8px 12px rgba(232,93,34,.3));}
.exp-wrap:hover .el-bb{transform:translateX(-50%) translateY(0) !important;}
.exp-wrap:hover .el-p1{transform:translateX(-50%) translateY(-28px) !important;}
.exp-wrap:hover .el-ch{transform:translateX(-50%) translateY(-58px) !important;}
.exp-wrap:hover .el-p2{transform:translateX(-50%) translateY(-90px) !important;}
.exp-wrap:hover .el-lt{transform:translateX(-50%) translateY(-124px) !important;}
.exp-wrap:hover .el-tm{transform:translateX(-50%) translateY(-154px) !important;}
.exp-wrap:hover .el-sc{transform:translateX(-50%) translateY(-180px) !important;}
.exp-wrap:hover .el-bt{transform:translateX(-50%) translateY(-210px) !important;}
.el-lbl{position:absolute;left:calc(100% + 12px);top:50%;transform:translateY(-50%) translateX(-4px);font-family:var(--font-h);font-size:1.1rem;letter-spacing:1px;text-transform:uppercase;color:var(--red);white-space:nowrap;opacity:0;pointer-events:none;transition:opacity .24s,transform .24s var(--ease);text-shadow: 1px 1px 0px var(--white);}
.el-lbl::before{content:"";position:absolute;right:100%;top:50%;transform:translateY(-50%);width:0;height:2px;background:var(--red);transition:width .24s var(--ease);margin-right:8px;}
.exp-wrap:hover .el-lbl{opacity:1;transform:translateY(-50%) translateX(0);}
.exp-wrap:hover .el-lbl::before{width:24px;}
.exp-layer svg{width:100%;display:block;}
.exp-glow{display:none;}
.exp-steam{position:absolute;bottom:88%;left:50%;transform:translateX(-50%);display:flex;gap:14px;opacity:0;transition:opacity .6s;}
.exp-steam.on{opacity:1;}
.esteam{width:3px;border-radius:2px;background:var(--red);animation:stA 2.4s ease-in-out infinite;}
.esteam:nth-child(1){height:26px;}
.esteam:nth-child(2){height:20px;animation-delay:.36s;}
.esteam:nth-child(3){height:32px;animation-delay:.72s;}
@keyframes stA{0%{transform:translateY(0) scaleY(1);opacity:.4;}100%{transform:translateY(-40px) scaleY(1.5);opacity:0;}}
.exp-hint{position:absolute;bottom:-10px;left:50%;transform:translateX(-50%);font-size:.7rem;font-weight:bold;letter-spacing:1px;text-transform:uppercase;color:var(--orange);white-space:nowrap;opacity:0;transition:opacity .5s;}
.exp-hint.on{opacity:1;}

.nos-body{font-size:1.05rem;color:var(--text-dark);line-height:1.7;margin-bottom:26px;font-weight:500;}
.nos-body strong{color:var(--red);font-weight:800;}
.hcard{background:var(--white);border:3px solid var(--orange);border-radius:12px;padding:24px;margin-bottom:26px;box-shadow: 4px 4px 0px var(--gold);}
.hcard-h{font-family:var(--font-h);font-size:1.1rem;letter-spacing:1px;text-transform:uppercase;color:var(--red);margin-bottom:16px;display:flex;align-items:center;gap:8px;}
.hrow{display:flex;justify-content:space-between;align-items:center;padding:8px 0;border-bottom:2px dashed var(--bg2);font-size:.9rem;font-weight:bold;}
.hrow:last-child{border-bottom:none;}
.hrow .hday{color:var(--grey);}
.hrow .htime{color:var(--orange);}
.hrow.today .hday{color:var(--red);font-weight:800;}
.hrow.today .htime{color:var(--red);}
.hrow.off .htime{color:var(--bg2);}
.itags{display:flex;flex-wrap:wrap;gap:10px;margin-bottom:26px;}
.itag{font-size:.8rem;font-weight:800;letter-spacing:1px;text-transform:uppercase;padding:8px 14px;border:2px solid var(--orange);border-radius:8px;color:var(--orange);background:var(--white);transition:transform .2s;}
.itag:hover{transform:scale(1.05);color:var(--red);border-color:var(--red);}

/* REVIEWS */
.rev-bg{background:var(--bg3);}
.rev-grid{display:grid;grid-template-columns:repeat(auto-fill,minmax(280px,1fr));gap:24px;margin-top:48px;}
.rv{background:var(--white);border:3px solid var(--orange);border-radius:12px;padding:28px;transition:transform .2s var(--spring);cursor:default;box-shadow: 4px 4px 0px var(--gold);}
.rv:hover{transform:translateY(-6px);box-shadow:6px 6px 0px var(--red);border-color:var(--red);}
.rv-q{font-family:var(--font-d);font-size:4.5rem;line-height:.55;color:var(--gold);opacity:.5;margin-bottom:11px;display:block;}
.rv-txt{font-size:1rem;line-height:1.6;color:var(--text-dark);font-weight:600;margin-bottom:24px;font-style:italic;}
.rv-stars{color:var(--red);font-size:1rem;margin-bottom:12px;display:block;letter-spacing:2px;}
.rv-who{display:flex;align-items:center;gap:12px;}
.rv-av{width:42px;height:42px;border-radius:50%;background:var(--red);display:flex;align-items:center;justify-content:center;font-family:var(--font-d);font-size:1.2rem;color:#FFF;flex-shrink:0;box-shadow: 2px 2px 0px var(--orange);}
.rv-name{font-size:.9rem;font-weight:800;color:var(--text-dark);display:block;margin-bottom:2px;}
.rv-date{font-size:.7rem;font-weight:600;color:var(--grey);}

/* CTA */
.cta-sec{text-align:center;padding:120px 52px;position:relative;overflow:hidden;background:var(--bg);}
.cta-sec::before{content:"HOLY DONA'S";position:absolute;top:50%;left:50%;transform:translate(-50%,-50%);font-family:var(--font-d);font-size:24vw;color:var(--bg2);pointer-events:none;white-space:nowrap;}
.cta-ey{font-size:.8rem;font-weight:800;letter-spacing:2px;text-transform:uppercase;color:var(--orange);margin-bottom:20px;display:block;}
.cta-title{font-family:var(--font-d);font-size:clamp(3.5rem,8vw,7.5rem);line-height:.9;text-transform:uppercase;margin-bottom:24px;color:var(--red);text-shadow: 4px 4px 0px var(--gold);}
.cta-title span{color:var(--orange);text-shadow: 4px 4px 0px var(--white);}
.cta-sub{font-size:1.1rem;font-weight:600;color:var(--text-dark);margin-bottom:48px;max-width:500px;margin-left:auto;margin-right:auto;line-height:1.6;}
.cta-wa{display:inline-flex;align-items:center;gap:14px;background:var(--red);color:#FFF;font-family:var(--font-h);font-size:1.3rem;letter-spacing:1px;padding:18px 48px;border-radius:12px;box-shadow:5px 5px 0px var(--gold);transition:transform .2s var(--spring);}
.cta-wa:hover{transform:translateY(-4px);box-shadow:7px 7px 0px var(--orange);}
.cta-wa svg{width:24px;height:24px;fill:currentColor;}
.cta-ph{margin-top:24px;font-size:.85rem;font-weight:bold;color:var(--grey);letter-spacing:1px;}
.cta-ph a{color:var(--red);transition:color .2s;}

/* FOOTER */
footer{background:var(--bg2);border-top:5px solid var(--orange);padding:60px 52px 40px;}
.fi{max-width:1360px;margin:0 auto;display:grid;grid-template-columns:2fr 1fr 1fr;gap:48px;margin-bottom:48px;}
.flogo{font-family:var(--font-d);font-size:2.5rem;letter-spacing:1px;margin-bottom:12px;color:var(--red);text-shadow: 2px 2px 0px var(--gold);}
.fslogan{font-size:.8rem;font-weight:800;letter-spacing:1px;text-transform:uppercase;color:var(--orange);margin-bottom:16px;}
.fdesc{font-size:.9rem;font-weight:600;color:var(--text-dark);line-height:1.7;max-width:300px;}
.fh{font-family:var(--font-h);font-size:1.2rem;letter-spacing:1px;text-transform:uppercase;margin-bottom:20px;color:var(--red);}
.flinks{list-style:none;}
.flinks li{margin-bottom:12px;}
.flinks a{font-size:.9rem;font-weight:bold;color:var(--grey);transition:color .2s;}
.flinks a:hover{color:var(--red);}
.fbot{max-width:1360px;margin:0 auto;border-top:2px solid var(--orange);padding-top:24px;display:flex;align-items:center;justify-content:space-between;flex-wrap:wrap;gap:12px;}
.fcopy{font-size:.75rem;font-weight:bold;color:var(--orange);letter-spacing:1px;}

/* WA FLOAT */
.wa-fl{position:fixed;bottom:26px;left:26px;z-index:450;width:56px;height:56px;background:var(--green);border-radius:50%;display:flex;align-items:center;justify-content:center;cursor:pointer;box-shadow:0 4px 18px rgba(37,211,102,.4);transition:transform .2s var(--ease);animation:waP 2.5s 4s ease-in-out infinite; border: 3px solid #FFF;}
.wa-fl:hover{transform:scale(1.1);animation:none;}
.wa-fl svg{width:28px;height:28px;fill:#fff;}
@keyframes waP{0%,100%{transform:scale(1);}50%{transform:scale(1.08);}}

/* MASCOT */
#mascot{display:none !important;}

/* CART PANEL */
.cart-panel{position:fixed;top:0;right:0;width:400px;height:100vh;background:var(--bg3);border-left:4px solid var(--orange);z-index:600;transform:translateX(100%);transition:transform .4s var(--ease);display:flex;flex-direction:column;overflow:hidden;box-shadow: -5px 0 20px rgba(0,0,0,0.1);}
.cart-panel.open{transform:translateX(0);}
.cart-head{padding:24px;border-bottom:3px solid var(--orange);display:flex;align-items:center;justify-content:space-between;background:var(--bg2);}
.cart-head-title{font-family:var(--font-d);font-size:1.8rem;letter-spacing:1px;text-transform:uppercase;color:var(--red);}
.cart-x{background:none;border:none;color:var(--text-dark);font-size:1.8rem;font-weight:bold;}
.cart-items{flex:1;overflow-y:auto;padding:20px;scrollbar-width:thin;scrollbar-color:var(--orange) transparent;}
.cart-empty{display:flex;flex-direction:column;align-items:center;justify-content:center;height:100%;gap:15px;opacity:.6;}
.cart-empty svg{width:64px;height:64px;stroke:var(--orange);fill:none;stroke-width:1.5;}
.cart-empty p{font-family:var(--font-h);font-size:1.2rem;letter-spacing:1px;text-transform:uppercase;color:var(--grey);}
.ci{display:flex;align-items:center;gap:14px;padding:16px 0;border-bottom:2px dashed var(--orange);}
.ci:last-child{border-bottom:none;}
.ci-img{width:60px;height:60px;border-radius:10px;object-fit:cover;flex-shrink:0;background:var(--bg2);border:2px solid var(--orange);}
.ci-info{flex:1;min-width:0;}
.ci-name{font-family:var(--font-d);font-size:1.1rem;letter-spacing:1px;text-transform:uppercase;color:var(--red);display:block;margin-bottom:2px;}
.ci-type{font-size:.7rem;font-weight:800;color:var(--orange);letter-spacing:1px;text-transform:uppercase;}
.ci-qty{display:flex;align-items:center;gap:8px;margin-top:8px;}
.ci-qty button{width:26px;height:26px;border-radius:6px;border:2px solid var(--orange);background:var(--white);color:var(--red);font-size:1rem;font-weight:bold;display:flex;align-items:center;justify-content:center;transition:background .18s;}
.ci-qty button:hover{background:var(--orange);color:#FFF;}
.ci-qty span{font-size:.9rem;font-weight:800;color:var(--text-dark);min-width:20px;text-align:center;}
.ci-right{display:flex;flex-direction:column;align-items:flex-end;gap:8px;}
.ci-price{font-family:var(--font-d);font-size:1.2rem;color:var(--red);white-space:nowrap;}
.ci-del{background:none;border:none;color:var(--grey);font-size:1.2rem;font-weight:bold;transition:color .18s;}
.ci-del:hover{color:var(--red);}
.cart-foot{padding:24px;border-top:3px solid var(--orange);background:var(--bg2);}
.cart-total{display:flex;justify-content:space-between;align-items:center;margin-bottom:20px;}
.cart-total-lbl{font-family:var(--font-h);font-size:1.2rem;letter-spacing:1px;text-transform:uppercase;color:var(--text-dark);}
.cart-total-val{font-family:var(--font-d);font-size:2rem;color:var(--red);text-shadow:2px 2px 0px var(--white);}
.cart-fin-btn{width:100%;display:flex;align-items:center;justify-content:center;gap:10px;background:var(--red);color:#FFF;font-family:var(--font-h);font-size:1.2rem;letter-spacing:1px;padding:16px;border:none;border-radius:10px;box-shadow:4px 4px 0px var(--orange);transition:transform .2s var(--spring);}
.cart-fin-btn:hover{transform:translateY(-2px);box-shadow:6px 6px 0px var(--orange);}
.cart-fin-btn svg{width:20px;height:20px;fill:currentColor;}
.cart-clr{width:100%;margin-top:12px;background:none;border:2px solid var(--grey);color:var(--grey);font-size:.8rem;font-weight:800;letter-spacing:1px;text-transform:uppercase;padding:10px;border-radius:8px;transition:border-color .2s,color .2s;}
.cart-clr:hover{border-color:var(--red);color:var(--red);}

/* MODALS */
.modal-bg, .det-bg, .del-bg{position:fixed;inset:0;background:rgba(255,245,209,.9);backdrop-filter:blur(6px);z-index:700;display:flex;align-items:center;justify-content:center;opacity:0;pointer-events:none;transition:opacity .2s;padding:20px;}
.modal-bg.open, .det-bg.open, .del-bg.open{opacity:1;pointer-events:all;}
.modal-box, .del-box{background:var(--white);border:4px solid var(--orange);border-radius:16px;padding:32px;max-width:400px;width:100%;transform:translateY(20px) scale(.95);transition:transform .3s var(--spring);position:relative;box-shadow: 8px 8px 0px var(--gold);}
.modal-bg.open .modal-box, .del-bg.open .del-box{transform:none;}
.modal-x, .det-x, .del-x{position:absolute;top:16px;right:20px;background:none;border:none;color:var(--text-dark);font-size:1.8rem;font-weight:bold;transition:color .18s;}
.modal-x:hover, .det-x:hover, .del-x:hover{color:var(--red);}
.modal-title, .del-title{font-family:var(--font-d);font-size:2rem;letter-spacing:1px;color:var(--red);text-transform:uppercase;margin-bottom:5px;text-shadow:2px 2px 0px var(--gold);}
.modal-sub, .del-sub{font-size:.9rem;font-weight:600;color:var(--grey);margin-bottom:24px;}
.modal-opts, .del-opts{display:grid;grid-template-columns:1fr 1fr;gap:12px;margin-bottom:24px;}
.mopt, .dopt{border:3px solid var(--bg2);border-radius:12px;padding:20px 10px;text-align:center;cursor:pointer;transition:all .2s var(--spring);background:var(--bg3);}
.mopt:hover, .dopt:hover{border-color:var(--orange);transform:scale(1.03);}
.mopt.sel, .dopt.sel{border-color:var(--red);background:var(--bg2);box-shadow: 4px 4px 0px var(--orange);}
.mopt-lbl, .dopt-lbl{font-family:var(--font-h);font-size:1.4rem;letter-spacing:1px;color:var(--text-dark);text-transform:uppercase;display:block;margin-bottom:4px;}
.mopt-price{font-family:var(--font-d);font-size:1.6rem;color:var(--red);}
.dopt-icon{font-size:2.2rem;display:block;margin-bottom:10px;}
.del-note{font-size:.8rem;font-weight:800;color:var(--red);background:var(--bg2);border:2px dashed var(--orange);border-radius:8px;padding:12px 14px;margin-bottom:20px;line-height:1.6;display:none;}
.del-note.show{display:block;}
.modal-add, .del-confirm{width:100%;background:var(--red);color:#FFF;font-family:var(--font-h);font-size:1.2rem;letter-spacing:1px;padding:16px;border:none;border-radius:10px;transition:transform .2s var(--spring);box-shadow:4px 4px 0px var(--gold); display:flex; justify-content:center; align-items:center; gap:10px;}
.modal-add:hover, .del-confirm:hover{transform:translateY(-2px);box-shadow:6px 6px 0px var(--orange);}

.det-box{background:var(--white);border:4px solid var(--orange);border-radius:16px;max-width:600px;width:100%;max-height:90vh;overflow-y:auto;transform:translateY(20px) scale(.95);transition:transform .3s var(--spring);position:relative;box-shadow: 8px 8px 0px var(--gold);}
.det-bg.open .det-box{transform:none;}
.det-img{width:100%;height:320px;object-fit:cover;border-radius:12px 12px 0 0; border-bottom:4px solid var(--orange);}
.det-body{padding:32px;}
.det-name{font-family:var(--font-d);font-size:2.5rem;letter-spacing:1px;color:var(--red);text-transform:uppercase;margin-bottom:10px;text-shadow:3px 3px 0px var(--gold);}
.det-ingr{font-size:1rem;font-weight:600;color:var(--text-dark);line-height:1.7;margin-bottom:24px;}
.det-x{position:absolute;top:16px;right:16px;background:var(--white);border:3px solid var(--orange);color:var(--red);font-size:1.6rem;font-weight:bold;width:44px;height:44px;border-radius:50%;display:flex;align-items:center;justify-content:center;box-shadow:3px 3px 0px var(--gold);transition:transform .2s;}
.det-x:hover{transform:scale(1.1);}

/* RESPONSIVE */
@media(max-width:1100px){
  nav,nav.sc{padding-left:28px;padding-right:28px;}
  .hero-content,.sw{padding-left:28px;padding-right:28px;}
  .nos-grid{grid-template-columns:1fr;gap:40px;}
  .fi{grid-template-columns:1fr 1fr;gap:30px;}
  .nav-clock{display:none;}
}
@media(max-width:768px){
  .nav-links{display:none;}
  .ham{display:flex;}
  .h-acts{justify-content:center;}
  .stats-bar{padding:20px 22px;}
  .stat-dv{display:none;}
  .sw{padding:70px 22px;}
  .fi{grid-template-columns:1fr;gap:24px;}
  footer{padding:50px 22px 30px;}
  .cta-sec{padding:90px 22px;}
  .cart-panel{width:100%;max-width:100%;border-left:none;}
  .exp-wrap{max-width:100%;height:380px;}
}
</style>
"@

$combined = $content.Substring(0, $startIndex) + $newStyle + $content.Substring($endIndex + 8)

[System.IO.File]::WriteAllText($path, $combined)
