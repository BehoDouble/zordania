<include file="commun/mail_debut.tpl" cache="1" />
Cet email a �t� envoy� � partir de {cfg_url}
Vous avez re�u cet email pour valider votre compte.

Vos identifiants sont :
Login: {mbr_login}
Mot de passe: {mbr_pass}
Pseudo: {mbr_pseudo}

Pour valider cette inscription, copier le lien suivant sur dans la barre d'adresse de votre navigateur.
{cfg_url}?sub=new&file=member&act=vld&key={vld_key}&mid={vld_mid}

(Les utilisateurs d'hotmail devront peut �tre copier et coller ce lien dans leur navigateur).

Si vous n'avez rien demand�, veuillez ignorer ce mail.<br/>

Cordialement,
<include file="commun/mail_fin.tpl" cache="1" />