<if cond='|{zzz_act}| == "ronflz"'>
	<p class="ok">Ok compte mit en veille !</p>
</if>
<elseif cond='|{zzz_act}| == "dring"'>
	<if cond='|{zzz_ok}|'>
		<p class="ok">Ok, compte r�activ�.</p>
	</if>
	<else>
		<p class="error">Vous devez encore attendre pour r�activer votre compte.</p>
	</else>
</elseif>
<elseif cond='|{zzz_act}| == "stats"'>
	<if cond='|{zzz_ok}|'>
		<p>
		Votre compte est en veille depuis le {zzz_date}.<br/>
		Vous pouvez maintenant r�activer votre compte, et continuer � jouer normalement.
		</p>
		<a href="index.php?file=zzz&amp;act=dring" title="R�activer votre compte">R�activer</a>
	</if>
	<else>
		<div class="error">Vous devez encore attendre pour r�activer votre compte.<br/>
		Il � �t� mis en veille le {zzz_date} et la dur�e minimale de mise en veille est dix jours.</div>
	</else>
</elseif>
<elseif cond='|{zzz_act}| == "rien"'>
<p>
Vous pouvez mettre en veille votre compte � partir de cette page.
Il sera mis en veille pour une dur�e minimale de 10 jours.
Pour r�activer votre compte apr�s cette dur�e, il suffit de revenir sur le site.
</p>
<form method="post" action="index.php?file=zzz&amp;act=ronflz">
	<label for="mbr_pass">Mot de passe</label>
	<input name="mbr_pass" type="password" />
	<input type="submit" value="Mettre en veille" />
</form>
</elseif>