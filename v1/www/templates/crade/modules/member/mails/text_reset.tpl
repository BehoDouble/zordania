<include file="commun/mail_debut.tpl" cache="1" />
Cet email a �t� envoy� � partir de {cfg_url}<br/>
Vous avez re�u cet email car vous voulez r�intialiser votre compte.<br/>
Pour valider cette modification, cliquez sur le lien suivant:<br/>
<br/>
<a href="{cfg_url}?file=member&amp;act=vld&amp;actsub=edit&amp;key={vld_key}&amp;mid={vld_mid}">{cfg_url}?sub=edit&file=member&act=vld&key={vld_key}&mid={vld_mid}</a><br/><br/>
<br/><br/>
(Les utilisateurs d'AOL devront peut �tre copier et coller ce lien dans leur navigateur).
<br/><br/>
Cordialement,<br/><br/>
<include file="commun/mail_fin.tpl" cache="1" />