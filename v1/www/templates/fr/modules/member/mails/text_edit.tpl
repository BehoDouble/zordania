<include file="commun/mail_debut.tpl" cache="1" />
Cet email a �t� envoy� � partir de {cfg_url}
Vous avez re�u cet email car une modification � �t� effectu�e sur votre compte.
Pour valider cette modification, copier le lien suivant sur dans la barre d'adresse de votre navigateur.
{cfg_url}?sub=edit&file=member&act=vld&key={vld_key}&mid={vld_mid}&mail={vld_mail}&pass={vld_pass}


Mot de passe : {vld_pass2}
Email : {vld_mail}

(Les utilisateurs d'hotmail devront peut �tre copier et coller ce lien dans leur navigateur).

Si vous n'avez rien demand�, veuillez ignorer ce mail.

Cordialement,
<include file="commun/mail_fin.tpl" cache="1" />