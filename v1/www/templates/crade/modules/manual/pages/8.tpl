<h3>Intro</h3>
<p>
Vous pouvez commencer � attaquer d'autres joueurs � partir de {ATQ_PTS_MIN} points.<br/>
Vous ne pouvez attaquer que les joueurs ayant votre nombre de points ({session_user[points]}) +- {ATQ_PTS_DIFF}.
<br/>
Les unit�s de combats ont des caract�ristiques sp�cifiques :<br/>
<dl>
	<dt>Vie</dt>
	<dd>La vie de l'unit�</dd>
	<dt>D�fense</dt>
	<dd>Les points de dommage que l'unit� infligera si elle est attaqu�e.</dd>
	<dt>Attaque</dt>
	<dd>Les points de dommage que l'unit� infligera si elle attaque des unit�s.</dd>
	<dt>Attaque B�timents</dt>
	<dd>Les points de dommage que l'unit� infligera si elle attaque des b�timents.</dd>
	<dt>Vitesse</dt>
	<dd>Vitesse de d�placement sur la carte.</dd>
</dl>
<br/>
Certains B�timents ont aussi des points de d�fense.<br/>
<br>
Infos about l'issue finale d'une attaque:
<dl>
	<dt><span class="victoire">victoire</span></dt>
	<dd>Vous perdez {ATQ_PERC_DEF}% de vos soldats au maximum, et tuez {ATQ_PERC_WIN}% des soldats ennemis au maximum</dl>
	<dt><span class="defaite">D�faite</span></dt>
	<dd>Vous perdez {ATQ_PERC_WIN}% de vos soldats au maximum, et tuez {ATQ_PERC_DEF}% des soldats ennemis au maximum</dl>
	<dt><span class="defaite">D�faite Partielle</span></dt>
	<dd>Vous perdez {ATQ_PERC_NUL}% de vos soldats au maximum.</dl>	
	<dt>Butin (pour celui qui attaque)</dt>
	<dd>
		<dl>
		<dt>Cas d'attaque sur des soldats</dt>
		<dd>Une des ressources n�cessaires pour former les unit�s tu�es * nombre de tu�s</dd>
		<dt>Cas d'attaque sur des b�timents</dt>
		<dd>Une des ressources n�cessaires pour construire le b�timent * un nombre bizarre que j'expliquerais pas.</dd>
		</dl>
	</dd>
	<dt>Butin (pour celui qui se fait attaquer)</dt>
	<dd>
		<dl>
		<dt>Victoire</dt>
		<dd>Une des ressources n�cessaires pour former les unit�s tu�es * nombre de tu�s</dd>
		<dt>D�faite</dt>
		<dd>Une des ressources n�cessaires pour former les unit�s tu�es * 0.6</dd>
		</dl>
	</dd>
	</dd></dl>
	<dt>Bonus</dt>
	<dd>Certaines unit�s donnent un bonus d'attaque ou de d�fense. Il marche comme ceci :
	<br/>
	<code>
	Si Bonus_Total > {GAME_MAX_UNT_BONUS}<br/>
	Alors Bonus_Total = {GAME_MAX_UNT_BONUS}<br/>
	Bonus = (Points_De_Dommage / 100) * Bonus_Total<br/>
	Points_De_Domage = Points_De_Domage + Bonus
	</code>
	</dd>
	<dt>Exp�rience</dt>
	<dd>
	<code>
	Si Victoire<br/>
	  atq_xp = 3<br/>
	Sinon<br/>
	  atq_xp = 1<br/>
	  <br/>
	atq_xp = round(nombre_b�timent_d�truits + nombre_tues / 100) + atq_xp
	</code>
	</dd>
	<dt>Espionnage</dt>
	<dd>
	Il est possible d'espionner les adversaires pour obtenir des estimations de leur d�fense.<br/>
	Cette � plus de chance de r�ussir si la l�gion est rapide !
	</dd>
	<dt>d�g�ts Max par jour</dt>
	<dd>
	Pour �viter de se faire massacrer en un seul jour, une limite journali�re de points de d�g�ts a �t� instaur�e.
	Ainsi un joueur ne pourra subir plus de {ATQ_PTS_MAX_PER_DAY}+ [Points] /10.
	</dd>
</dl>		
</p>
<hr />
<h3>Attaque</h3>
<p>
Une bataille se d�roule en 3 actes :<br/>
<dl>
	<dt>
	Le D�placement
	</dt>
	<dd>
	Vous choisissez un joueur � attaquer, et pendant un temps d�fini par la distance entre vous et lui et la moyenne des vitesses des unit�s de la l�gion qui attaque, la l�gion se d�place jusqu'a lui.
	<br/>
	Chaque tour la l�gion peu avancer  de x (vitesse de la l�gion) nombre de cases, que ce soit en diagonale ou en ligne droite.
	</dd>
	<dt>L'Attaque</dt>
	<dd>
	Une fois la l�gion arriv�e, vous devez lui donner l'ordre d'attaquer.<br/>
	Ici il y'a deux possibilit�es :
	<ul>
		<li>
		Le Village est d�fendu par des soldats, dans ce cas vous attaquez les soldats.
		<ul>
			<li>La somme de vos points d'attaque est sup�rieure � la somme des points de d�fense de l'ennemi : <span class="victoire">Victoire</span></li>
			<li>La somme de vos points d'attaque est inf�rieure � la somme des points de d�fense de l'ennemi : <span class="defaite">D�faite</span></li>
		</ul>
		</li>
		<li>
		Le Village n'est pas d�fendu, vous attaquez les b�timents ({ATQ_MAX_BTC} au maximum). Apres chaque b�timents attaqu�s, la force d'attaque restante est divis�e par deux.
		<ul>
			<li>La somme de vos points d'attaque est sup�rieure � la somme des points de d�fense de l'ennemi : <span class="victoire">Victoire</span></li>
			<li>La somme de vos points d'attaque est inf�rieure � la somme des points de d�fense de l'ennemi mais vous d�truisez un b�timent : <span class="defaite">D�faite partielle</span></li>
			<li>La somme de vos points d'attaque est inf�rieure � la somme des points de d�fense de l'ennemi : <span class="defaite">D�faite</span></li>
		</ul>
		</li>
	</ul>
	</dd>
	<dt>Retour au village</dt>
	<dd>M�me chose qu'au d�but</dd>
</dl>
</p>