<p class="menu_module">
[
<a href="index.php?file=war&act=histo" title="Historique de vos attaques, et de celle de vos ennemis.">Journal de guerre</a>
]
- 
[
<a href="index.php?file=leg" title="Cr�er, Modifier, D�placer vos L�gions">Gestion des L�gions</a>
] -
[
<a href="index.php?file=war&act=atq" title="Attaquer un autre membre.">Attaquer</a>
] -
[
<a href="index.php?file=war&act=enc" title="Voir les attaques en cours.">Attaques en cours</a>
]
<hr />

</p>

<if cond='|{war_act}| == "atq"'>
	<if cond='|{war_sub}| == "war_no_mid"'>
		<div class="infos">
		Veuillez choisir un membre � attaquer dans la 
		<a href="index.php?file=member&act=liste" title="Afficher la liste des joueurs">Liste</a> ou sur la 
		<a href="index.php?file=carte" title="Regarder la carte">Carte</a>.
		</div>
		<br/>
		<if cond='{pas_assez_de_pts}'>
		<div class="infos">
		Il vous faut au minimum {pas_assez_de_pts} pour attaquer quelqu'un !
		</div>
		</if>
		
	</if>
	<elseif cond='|{war_sub}| == "war_cant_atq"'>
		<div class="error">
		Impossible d'attaquer ce membre car 
		<if cond='|{war_can_atq}| == 3'>
		ce membre n'existe pas.
		</if>
		<elseif cond='|{war_can_atq}| == 2'>
		vous n'avez pas assez de points (il faut au minimum {ATQ_PTS_MIN}).
		</elseif>
		<elseif cond='|{war_can_atq}| === 1'>
		son niveau est beaucoup plus faible que le votre.
		</elseif>
		</div>
	</elseif>
	<elseif cond='|{war_sub}| == "choix_leg"'>
	 	<if cond='count(|{leg_array}|) > 0'>
		<form method="post" action="index.php?file=war&act=atq&mid={atq_mid}">
		<foreach cond='|{leg_array}| as |{leg_id}| => |{leg_value}|'>
		
		<div class="list_univ" id="leg_{leg_id}">
		<if cond='|{leg_value[leg_etat]}| == 0'>
		<input style="float: left;" type="radio" name="lid" id="lid{leg_id}" value="{leg_id}" />
  		</if>
  		<label for="lid{leg_id}">
  				
		<strong>Etat</strong> : {leg[{leg_value[leg_etat]}]} - <strong>Nom</strong> : {leg_value[leg_name]}<br />
		<strong>Experience</strong> : {leg_value[leg_xp]}
		<if cond='|{leg_value[leg_etat]}| != 0'>
		 - <strong>Position</strong> X: {leg_value[map_x]} Y: {leg_value[map_y]} 
		</if> <br />
			<if cond='is_array(|{unt_array[{leg_id}]}|)'>
				<strong>Force</strong>:
				{leg_value[leg_atq]} <if cond="|{leg_value[leg_bonus][bonus_xp]}| OR |{leg_value[leg_bonus][bonus_atq]}|">(+<math oper="round({leg_value[leg_atq]}*(({leg_value[leg_bonus][bonus_xp]}+{leg_value[leg_bonus][bonus_atq]})/100))" />)</if>
				<img src="img/{session_user[race]}/div/atq.png" alt="Attaque Unit�s" title="Attaque Unit�s" />
				 - 
				{leg_value[leg_atq_btc]} <if cond="|{leg_value[leg_bonus][bonus_xp]}| OR |{leg_value[leg_bonus][bonus_atq]}|">(+<math oper="round({leg_value[leg_atq_btc]}*(({leg_value[leg_bonus][bonus_xp]}+{leg_value[leg_bonus][bonus_atq]})/100))" />)</if>
				<img src="img/{session_user[race]}/div/atq_btc.png" alt="Attaque B�timents" title="Attaque B�timents" />
				 - 
				{leg_value[leg_def]} <if cond="|{leg_value[leg_bonus][bonus_xp]}| OR |{btc_bonus_def}| OR |{leg_value[leg_bonus][bonus_def]}|">(+<math oper="round({leg_value[leg_def]}*{btc_bonus_def}/100)+round({leg_value[leg_def]}*(({leg_value[leg_bonus][bonus_xp]}+{leg_value[leg_bonus][bonus_def]})/100))" />)</if>
				<img src="img/{session_user[race]}/div/def.png" alt="D�fense" title="D�fense" />
				<br/>
				<strong>Bonus</strong>:
				{leg_value[leg_bonus][bonus_atq]}% 
				<img src="img/{session_user[race]}/div/atq.png" alt="Bonus d'Attaque" title="Bonus d'Attaque" />
				-
				{leg_value[leg_bonus][bonus_def]}% 
				<img src="img/{session_user[race]}/div/def.png" alt="Bonus de D�fense" title="Bonus de D�fense" />
				<strong>Bonus XP</strong>: {leg_value[leg_bonus][bonus_xp]}% 
				<br/>
	    			<a id="leg_{leg_id}_toggle" href="javascript:toggle('leg_{leg_id}');"><img src="img/minus.png" alt="-" /></a>
				<table class="border1" id="descr_leg_{leg_id}_0" style="display:block;">
					<tr>
					<th>Type</th>
					<th>Nombre</th>
					<th><img src="img/{session_user[race]}/div/atq.png" alt="Attaque Unit�s" title="Attaque Unit�s" />-<img src="img/{session_user[race]}/div/atq_btc.png" alt="Attaque B�timents" title="Attaque B�timents" />-<img src="img/{session_user[race]}/div/def.png" alt="D�fense" title="D�fense" /> Total</th>
					<th>Bonus</th>
					</tr>
				<foreach cond='|{unt_array[{leg_id}]}| as |{unt_type}| => |{unt_value}|'>
					<tr>
						<td><img src="img/{session_user[race]}/unt/{unt_type}.png" alt="{unt[{session_user[race]}][alt][{unt_type}]}" title="{unt[{session_user[race]}][alt][{unt_type}]}" /> {unt[{session_user[race]}][alt][{unt_type}]}</td>
						<td>{unt_value[unt_nb]}</td>
						<td><math oper="{unt_conf[{unt_type}][attaque]}*{unt_value[unt_nb]}" /><img src="img/{session_user[race]}/div/atq.png" alt="Attaque Unit�s" title="Attaque Unit�s" /> <math oper="{unt_conf[{unt_type}][attaquebat]}*{unt_value[unt_nb]}" /><img src="img/{session_user[race]}/div/atq_btc.png" alt="Attaque B�timents" title="Attaque B�timents" /> <math oper="{unt_conf[{unt_type}][defense]}*{unt_value[unt_nb]}" /><img src="img/{session_user[race]}/div/def.png" alt="D�fense" title="D�fense" /></td>
						<td>
						<set name="bonus_def" value='<math oper="{unt_conf[{unt_type}][bonus][def]}*{unt_value[unt_nb]}" />' />
						<set name="bonus_atq" value='<math oper="{unt_conf[{unt_type}][bonus][atq]}*{unt_value[unt_nb]}" />' />
						<if cond="{bonus_atq}">
							<if cond="|{bonus_def}| < |{GAME_MAX_UNT_BONUS}|">{bonus_atq}</if><else>{GAME_MAX_UNT_BONUS}</else>%
							<img src="img/{session_user[race]}/div/atq.png" alt="Bonus d'Attaque" title="Bonus d'Attaque" />
						</if>
						<if cond="{bonus_def}">
							<if cond="|{bonus_atq}| < |{GAME_MAX_UNT_BONUS}|">{bonus_def}</if><else>{GAME_MAX_UNT_BONUS}</else>%
							<img src="img/{session_user[race]}/div/def.png" alt="Bonus de D�fense" title="Bonus de D�fense"" />
						</if>
						</td>
					</tr>
				</foreach>
				</table>
			</if>
			<else>
				<br />Aucune unit� dans cette L�gion - <a href="index.php?file=leg&act=del_leg&lid={leg_id}" title="Supprimer cette l�gion">Supprimer</a>
		
			</else>
			</label>
		</div>
		<if cond='is_array(|{unt_array[{leg_id}]}|)'>
			<script type="text/javascript">toggle('leg_{leg_id}');</script>
		</if>
		</foreach>
		<div class="center"><input type="submit" value="Attaquer" name="submit" /></div>
		</form>
		</if>
		<else>
			<p class="infos">Vous n'avez aucune l�gion disponible.</p>
		</else>
	</elseif>
	<elseif cond='|{war_sub}| == "war_atq"'>
		<if cond='|{war_ok}| == 1'>
			<p class="ok">Votre L�gion est en route, d�s qu'elle sera arriv�e, vous devrez lui donner l'ordre d'attaquer !</p>
		</if>
		<elseif cond='|{war_ok}| == 2'>
			<p class="error">Cette L�gion n'existe pas ou n'est pas disponible.</p>
		</elseif>
		<elseif cond='|{war_ok}| == 4'>
			<p class="error">Cette L�gion est vide.</p>
		</elseif>
		<elseif cond='|{war_ok}| == 3'>
			<p class="error">Ce joueur n'existe pas.</p>
		</elseif>
	</elseif>
</if>
<elseif cond='|{war_act}| == "histo"'>
 <div class="infos">Ce journal est r�guli�rement vid� pour ne pas encombrer la base de donn�e du site.
 </div>
 <br />
 <if cond='count(|{atq_array}|) > 0'>
 <foreach cond='|{atq_array}| as |{result}|'>
   <if cond='!is_array(|{unt[{result[mbr_race]}][alt]}|)'>
	<load file="race/{result[mbr_race]}.config" />
   </if>	
   <div class="list_univ">
   <if cond='|{result[atq_mid]}| != |{user_mid}|'>
    <h3><img src="img/{session_user[race]}/div/def.png" alt="def" title="Vous avez �t� attaqu�" /> Vous avez �t� attaqu� par {result[mbr_pseudo]}</h3> 
    	
    <p class="{atq_result[{result[atq_result]}][css][1]}">{atq_result[{result[atq_result]}][text][1]}</p> 
    
    Date : {result[atq_date_arv_formated]}
	  <!--
	  <h4>Force de {result[mbr_pseudo]}</h4>
	  
	  <strong>Bonus d'attaque total: </strong> {result[bilan_war][bonus_atq]}% <img src="img/{result[mbr_race]}/div/atq.png" alt="Bonus d'attaque" title="Bonus d'attaque" /><br/>
	  <strong>Force d'attaque contre les unit�s :</strong> {result[atq_atq_unt]} (+<math oper="round({result[atq_atq_unt]}*{result[bilan_war][bonus_atq]}/100)" />) <img src="img/{result[mbr_race]}/div/atq.png" alt="Attaque Unit�s" title="Attaque Unit�s" /><br/>
	  <strong>Force d'attaque contre les b�timents: </strong> {result[atq_atq_btc]} (+<math oper="round({result[atq_atq_btc]}*{result[bilan_war][bonus_atq]}/100)" />)  <img src="img/{result[mbr_race]}/div/atq_btc.png" alt="Attaque B�timents" title="Attaque B�timents" /><br/>  
	  <hr /> 
	  <h4>Votre d�fense</h4>	
	  <strong>Bonus de d�fense des b�timents: {result[bilan_war][bonus_def][btc]}% <img src="img/{session_user[race]}/div/def.png" alt="Bonus de d�fense" title="Bonus de d�fense" /></strong> 
	  <br />
	  <strong>D�fense totale:</strong> {result[atq_def]} <img src="img/{session_user[race]}/div/def.png" alt="D�fense" title="D�fense" /><br/>
	  <hr />
	  -->
	  <h4>Morts</h4>
	  <strong>Vous infligez {result[bilan_war][atq_def_eff]} points de d�g�ts...</strong>
	  <strong>Vous tuez {result[bilan_war][atq_morts]} soldat(s).</strong><br/>
	  <if cond='is_array(|{result[bilan_war][details_unt][{result[atq_mid]}]}|)'>
	  <foreach cond='|{result[bilan_war][details_unt][{result[atq_mid]}]}| as |{leg_lid}| => |{leg_value}|'>
	  	<foreach cond='|{leg_value}| as |{unt_type}| => |{unt_nb}|'>
	  	<if cond='|{unt_nb}| > 0'>
	  	{unt_nb}<img src="img/{result[mbr_race]}/unt/{unt_type}.png" alt="{unt[{result[mbr_race]}][alt][{unt_type}]}" title="{unt[{result[mbr_race]}][alt][{unt_type}]}" />
	  	</if>
	  	</foreach>
	  </foreach>
	  </if>
	  <hr />
	  <h4>Pertes</h4>
	  <strong>Il vous inflige {result[bilan_war][atq_atq_unt_eff]} points de d�g�ts...</strong>
	  <strong>{result[bilan_war][atq_tues]} de vos soldat(s) sont morts.</strong><br/>
	  <if cond='is_array(|{result[bilan_war][details_unt][{result[atq_mid2]}]}|)'>
	  <foreach cond='|{result[bilan_war][details_unt][{result[atq_mid2]}]}| as |{leg_lid}| => |{leg_value}|'>
	  	<foreach cond='|{leg_value}| as |{unt_type}| => |{unt_nb}|'>
	  	<if cond='|{unt_nb}| > 0'>
	  	{unt_nb} <img src="img/{session_user[race]}/unt/{unt_type}.png" alt="{unt[{session_user[race]}][alt][{unt_type}]}" title="{unt[{session_user[race]}][alt][{unt_type}]}" />
	  	</if>
	  	</foreach>
	  </foreach>
	  </if>
	  <hr />
	  <h4>B�timents D�truits</h4>
	  <strong>Il vous inflige {result[bilan_war][atq_atq_btc_eff]} points de d�g�ts...</strong>
	  <br />
	  <if cond='is_array(|{result[bilan_war][details_btc]}|)'>
	  	<if cond='|{result[bilan_war][atq_btc]}| > 0'>
	  		{bilan_war[atq_btc]} b�timent(s) d�truit(s).<br/>
	  	</if>
	  	<foreach cond='|{result[bilan_war][details_btc]}| as |{btc_bid}| => |{btc_value}|'>
	  		<if cond="|{btc_value[btc_vie]}| <= 0">
	  		<img src="img/{session_user[race]}/btc/{btc_value[btc_type]}.png" alt="{btc[{session_user[race]}][alt][{btc_value[btc_type]}]}" title="{btc[{session_user[race]}][alt][{btc_value[btc_type]}]}" />
	  		</if>
	  	</foreach>
	  	<br/>
	  	<if cond='|{result[bilan_war][atq_btc_end]}| > 0'>
	  		{bilan_war[atq_btc_end]} b�timent(s) endommag�(s).<br/>
	  	</if>
	  	<foreach cond='|{result[bilan_war][details_btc]}| as |{btc_bid}| => |{btc_value}|'>
	  		<if cond="|{btc_value[btc_vie]}| > 0">
	  		<img src="img/{session_user[race]}/btc/{btc_value[btc_type]}.png" alt="{btc[{session_user[race]}][alt][{btc_value[btc_type]}]}" title="{btc[{session_user[race]}][alt][{btc_value[btc_type]}]}" />
	  		</if>
	  	</foreach>
	  </if>
	  <else>
	  Aucun
	  </else>
	  <hr />
	  <h4>Pertes:</h4>
	  <if cond="|{result[bilan_war][atq_res1_nb]}| > 0">
	  <span class="gain">{result[bilan_war][atq_res1_nb]}</span><img src="img/{result[mbr_race]}/res/{result[bilan_war][atq_res1_type]}.png" alt="{res[{result[mbr_race]}][alt][{result[bilan_war][atq_res1_type]}]}" title="{res[{result[mbr_race]}][alt][{result[bilan_war][atq_res1_type]}]}" />
	  </if>
	  <if cond="|{result[bilan_war][atq_res2_nb]}| > 0">
	  <span class="gain">{result[bilan_war][atq_res2_nb]}</span><img src="img/{result[mbr_race]}/res/{result[bilan_war][atq_res2_type]}.png" alt="{res[{result[mbr_race]}][alt][{result[bilan_war][atq_res2_type]}]}" title="{res[{result[mbr_race]}][alt][{result[bilan_war][atq_res2_type]}]}" />	  
	  </if>
   </if>
   <else>
    <h3><img src="img/{session_user[race]}/div/atq.png" alt="atq" title="Vous attaquez" />Vous avez attaqu� {result[mbr_pseudo]}</h3>
	  <p class="{atq_result[{result[atq_result]}][css][0]}">{atq_result[{result[atq_result]}][text][0]}</p> 
	  Date : {result[atq_date_arv_formated]}
	  <h4>Vous attaquez avec</h4>
	  <br/>
	 	<foreach cond='|{result[bilan_war][unt_array_mid1]}| as |{unt_type}| => |{unt_value}|'>
	  	{unt_value[unt_nb]}<img src="img/{session_user[race]}/unt/{unt_type}.png" alt="{unt[{session_user[race]}][alt][{unt_type}]}" title="{unt[{session_user[race]}][alt][{unt_type}]}" />
	 	</foreach>
	 	<br />
	 	<strong>L�gion:</strong> {result[bilan_war][unt_array_mid1][{unt_type}][leg_name]}<br />
	 	<!-- <strong>Experience:</strong> {result[bilan_war][unt_array_mid1][{unt_type}][leg_xp]} (<math oper="floor({result[bilan_war][unt_array_mid1][{unt_type}][leg_xp]}/100)" />% <img src="img/{session_user[race]}/div/atq.png" alt="Bonus d'attaque" title="Bonus d'attaque" />)-->
	  <br/>
	  <!--
	  <strong>Bonus d'attaque total: </strong> {result[bilan_war][bonus_atq]}% <img src="img/{session_user[race]}/div/atq.png" alt="Bonus d'attaque" title="Bonus d'attaque" /><br/>
	  <strong>Force d'attaque contre les unit�s :</strong> {result[atq_atq_unt]} (+<math oper="round({result[atq_atq_unt]}*{result[bilan_war][bonus_atq]}/100)" />) <img src="img/{session_user[race]}/div/atq.png" alt="Attaque Unit�s" title="Attaque Unit�s" /><br/>
	  <strong>Force d'attaque contre les b�timents: </strong> {result[atq_atq_btc]} (+<math oper="round({result[atq_atq_btc]}*{result[bilan_war][bonus_atq]}/100)" />)  <img src="img/{session_user[race]}/div/atq_btc.png" alt="Attaque B�timents" title="Attaque B�timents" /><br/>  
	  <hr /> 
	  <h4>D�fense de {result[mbr_pseudo]}</h4>	
	  <strong>Bonus de d�fense des b�timents: {result[bilan_war][bonus_def][btc]}% <img src="img/{result[mbr_race]}/div/def.png" alt="Bonus de d�fense" title="Bonus de d�fense" /></strong> 
	  <br />
	  <strong>D�fense totale:</strong> {result[atq_def]} <img src="img/{result[mbr_race]}/div/def.png" alt="D�fense" title="D�fense" /><br/>
	  <hr />
	  -->
	  <h4>Pertes</h4>
	  <strong>Votre arm�e re�oit {result[bilan_war][atq_def_eff]} points de d�g�ts...</strong>
	  <strong>Vous perdez {result[bilan_war][atq_morts]} soldat(s).</strong><br/>
	  <if cond='is_array(|{result[bilan_war][details_unt][{session_user[mid]}]}|)'>
	  <foreach cond='|{result[bilan_war][details_unt][{session_user[mid]}]}| as |{leg_lid}| => |{leg_value}|'>
	  	<foreach cond='|{leg_value}| as |{unt_type}| => |{unt_nb}|'>
	  	<if cond='|{unt_nb}| > 0'>
	  	{unt_nb}<img src="img/{session_user[race]}/unt/{unt_type}.png" alt="{unt[{session_user[race]}][alt][{unt_type}]}" title="{unt[{session_user[race]}][alt][{unt_type}]}" />
	  	</if>
	  	</foreach>
	  </foreach>
	  </if>
	  <hr />
	  <h4>Tu�s</h4>
	  <strong>Vous infligez {result[bilan_war][atq_atq_unt_eff]} points de d�g�ts...</strong>
	  <strong>Vos soldats tuent {result[bilan_war][atq_tues]} soldat(s).</strong><br/>
	  <if cond='is_array(|{result[bilan_war][details_unt][{result[atq_mid2]}]}|)'>
	  <foreach cond='|{result[bilan_war][details_unt][{result[atq_mid2]}]}| as |{leg_lid}| => |{leg_value}|'>
	  	<foreach cond='|{leg_value}| as |{unt_type}| => |{unt_nb}|'>
	  	<if cond='|{unt_nb}| > 0'>
	  	{unt_nb} <img src="img/{result[mbr_race]}/unt/{unt_type}.png" alt="{unt[{result[mbr_race]}][alt][{unt_type}]}" title="{unt[{result[mbr_race]}][alt][{unt_type}]}" />
	  	</if>
	  	</foreach>
	  </foreach>
	  </if>
	  <hr />
	  <h4>B�timents D�truits</h4>
	  <strong>Vous infligez {result[bilan_war][atq_atq_btc_eff]} points de d�g�ts...</strong>
	  <br />
	  <if cond='is_array(|{result[bilan_war][details_btc]}|)'>
	  	<if cond='|{result[bilan_war][atq_btc]}| > 0'>
	  		Vos soldats d�truisent {bilan_war[atq_btc]} b�timent.<br/>
	  	</if>
	  	<foreach cond='|{result[bilan_war][details_btc]}| as |{btc_bid}| => |{btc_value}|'>
	  		<if cond="|{btc_value[btc_vie]}| <= 0">
	  		<img src="img/{result[mbr_race]}/btc/{btc_value[btc_type]}.png" alt="{btc[{result[mbr_race]}][alt][{btc_value[btc_type]}]}" title="{btc[{result[mbr_race]}][alt][{btc_value[btc_type]}]}" />
	  		</if>
	  	</foreach>
	  	<br/>
	  	<if cond='|{result[bilan_war][atq_btc_end]}| > 0'>
	  		Vos soldats endommagent {bilan_war[atq_btc_end]} b�timent.<br/>
	  	</if>
	  	<foreach cond='|{result[bilan_war][details_btc]}| as |{btc_bid}| => |{btc_value}|'>
	  		<if cond="|{btc_value[btc_vie]}| > 0">
	  		<img src="img/{result[mbr_race]}/btc/{btc_value[btc_type]}.png" alt="{btc[{result[mbr_race]}][alt][{btc_value[btc_type]}]}" title="{btc[{result[mbr_race]}][alt][{btc_value[btc_type]}]}" />
	  		</if>
	  	</foreach>
	  </if>
	  <else>
	  Aucun
	  </else>
	  <hr />
	  <h4>Butin:</h4>
	  <if cond="|{result[bilan_war][atq_res1_nb]}| > 0">
	  <span class="gain">{result[bilan_war][atq_res1_nb]}</span><img src="img/{session_user[race]}/res/{result[bilan_war][atq_res1_type]}.png" alt="{res[{session_user[race]}][alt][{result[bilan_war][atq_res1_type]}]}" title="{res[{session_user[race]}][alt][{result[bilan_war][atq_res1_type]}]}" />
	  </if>
	  <if cond="|{result[bilan_war][atq_res2_nb]}| > 0">
	  <span class="gain">{result[bilan_war][atq_res2_nb]}</span><img src="img/{session_user[race]}/res/{result[bilan_war][atq_res2_type]}.png" alt="{res[{session_user[race]}][alt][{result[bilan_war][atq_res2_type]}]}" title="{res[{session_user[race]}][alt][{result[bilan_war][atq_res2_type]}]}" />	  
	  </if>
	  <br/>
	  Votre l�gion gagne {result[bilan_war][leg_xp][{result[bilan_war][leg_lid]}]} points d'xp.	   
   </else>
   </div>     
 </foreach>

  <br />Page : 
  <for cond='|{i}| = 0; |{i}| < |{atq_nb}|; |{i}|+=|{limite_page}|'>
   <if cond='|{i}| / |{limite_page}| != |{war_page}|'>
   <a href="index.php?file=war&act=histo&war_page=<math oper='({i} / {limite_page})' />"><math oper='(({i} / {limite_page})+1)' /></a>
   </if>
   <else>
   <math oper='(({i} / {limite_page})+1)' />
   </else>
  </for>
 </if>
</elseif>
<elseif cond='|{war_act}| == "enc"'>
 <if cond='count(|{atq_array}|) > 0'>
 <foreach cond='|{atq_array}| as |{result}|'>
   <div class="list_univ">
   <if cond='|{result[atq_mid]}| != |{user_mid}|'>
    <h3><img src="img/{session_user[race]}/div/def.png" alt="def" title="Vous allez �tre attaqu�" />Vous allez �tre attaqu� par {result[mbr_pseudo]}</h3>
    Distance : {result[atq_dst]} 
   </if>
   <else>
    <h3><img src="img/{session_user[race]}/div/atq.png" alt="atq" title="Vous attaquez" />Vous attaquez {result[mbr_pseudo]}</h3>
    
    L�gion : {result[leg_name]}<br/>
    Vitesse : {result[atq_speed]}<br />
    Date de D�part : {result[atq_date_dep_formated]}<br />
    Distance : {result[atq_dst]}<br />
    Nombre de tours avant attaque : <math oper='ceil({result[atq_dst]} / {result[atq_speed]})' /> tour(s) (<math oper='ceil(({result[atq_dst]} / {result[atq_speed]}) / 2)' />H)<br />
    ---<br/>
    Force d'attaque :
    <ul>
     <li>Unit�s: {result[atq_atq_unt]} <img src="img/{session_user[race]}/div/atq.png" alt="Attaque Unit�s" title="Attaque Unit�s" /></li>
     <li>B�timents: {result[atq_atq_btc]} <img src="img/{session_user[race]}/div/atq_btc.png" alt="Attaque B�timents" title="Attaque B�timents" /></li>
    </ul>
    ---<br/>
    [ <a href="index.php?file=war&act=cancel&aid={result[atq_aid]}" title="Rappeler vos hommes">Annuler</a> ]
    <if cond='|{session_user[atqnb]}| >= |{ATQ_NB_MAX_PER_DAY}|'>
    - Barre des {ATQ_NB_MAX_PER_DAY} attaques journali�res depass�e.
    </if>
    <elseif cond='|{result[atq_dst]}| == 0'>
    - [
      <a href="index.php?file=war&act=make_attack&sub=esp&aid={result[atq_aid]}" title="R�cup�rer des informations sur les d�fenses de l'ennemi !">Espionner</a>
    ]
    -
    [ 
    <a href="index.php?file=war&act=make_attack&aid={result[atq_aid]}" title="Lancer l'attaque !">Attaquer</a>
    ] - Attaques possibles aujourd'hui: <math oper="({ATQ_NB_MAX_PER_DAY}-{session_user[atqnb]})" />/{ATQ_NB_MAX_PER_DAY}
    </elseif>
   </else>
   </div> 	    
 </foreach>

  <br />Page : 
  <for cond='|{i}| = 0; |{i}| < |{atq_nb}|; |{i}|+=|{limite_page}|'>
   <if cond='|{i}| / |{limite_page}| != |{war_page}|'>
   <a href="index.php?file=war&act=enc&war_page=<math oper='({i} / {limite_page})' />"><math oper='(({i} / {limite_page})+1)' /></a>
   </if>
   <else>
   <math oper='(({i} / {limite_page})+1)' />
   </else>
  </for>
 </if>
 <else>
  <p class="infos">Aucune attaque en ce moment.</p>
 </else>
</elseif>
<elseif cond='|{war_act}| == "cancel"'>
 <if cond='|{war_cancel}| == "ok"'>
 	<p class="ok">Attaque annul�e, vos hommes sont sur le chemin du retour</p>
 </if>
 <elseif cond='|{war_cancel}| == "error"'>
 	<p class="error">Erreur, cette attaque n'existe probablement pas.</p>
 </elseif>
 <elseif cond='|{war_cancel}| == "no_aid"'>
 	<p class="error">Aucune attaque sp�cifi�e</p>
 </elseif> 
</elseif>
<elseif cond='|{war_act}| == "make_attack"'>
	<if cond='|{no_atq_aid}| == true'>
	<p class="error">Cette l�gion n'attend aucun ordre !</p>
	</if>
	<elseif cond='|{atq_canceled}| == true'>
		<if cond='|{atq_mbr_inac}|'>
		<p class="infos">Le village �tait abandonn� depuis des si�cles, la l�gion est sur le chemin du retour ...</p>
		</if>
		<else>
		<p class="infos">Les arm�es de ce village ne sont vraiment pas comparables aux n�tres, inutile de l'attaquer ...</p>
		</else>
	</elseif>
	<elseif cond='|{atq_esp_ok}| == true'>
	  <if cond='|{session_user[race]}| != |{atq_array[mbr_race]}|'>
	  	<load file="race/{atq_array[mbr_race]}.config" />
	  </if>	
	 <div class="block_1">
	 <div id="atq_1" style="display:block;">
	 Estimations de vos observateurs :
	 </div>
	 <hr />
	 <div id="atq_2" style="display:block;">
	 <strong>L�gions Aper�ues:</strong><br />
	  	<table class="border1">
	  		<tr>
	  		<th>Unit�s</th>
	  		<th>Nom</th>
	  		<th>Experience</th>
	  		</tr>
	  	<if cond="is_array(|{bilan_esp[unt_array]}|)">
	  	<foreach cond='|{bilan_esp[unt_array]}| as |{unt_mid2_leg_lid}| => |{unt_mid2_leg_value}|'>
	  	<tr>
	  	<td>
	  	<foreach cond='|{unt_mid2_leg_value}| as |{unt_type}| => |{unt_value}|'>
	  	{unt_value[unt_nb]}<img src="img/{atq_array[mbr_race]}/unt/{unt_type}.png" alt="{unt[{atq_array[mbr_race]}][alt][{unt_type}]}" title="{unt[{atq_array[mbr_race]}][alt][{unt_type}]}" />
	 	</foreach>
	 	</td>
	 	<td>{unt_value[leg_name]}</td>
	 	<td>{unt_value[leg_xp]}</td>
	 	</tr>
	 	</foreach>
	 	</if>
	 	</table>
	 </div>
	 <hr />
	 <div id="atq_3" style="display:block;">
	 	  <strong>B�timents Aper�us:</strong><br />
	  	  <foreach cond='|{bilan_esp[btc_array]}| as |{btc_value}|'>
	  		<img src="img/{atq_array[mbr_race]}/btc/{btc_value[btc_type]}.png" alt="{btc[{atq_array[mbr_race]}][alt][{btc_value[btc_type]}]}" title="{btc[{atq_array[mbr_race]}][alt][{btc_value[btc_type]}]}" />
	 	  </foreach>
	 </div>
	 <hr />
	 <div id="atq_4" style="display:block;">
	 	<strong>Ressources Aper�ues:</strong><br />
	  	  <foreach cond='|{bilan_esp[res_array]}| as |{res_type}| => |{res_value}|'>
	  		{res_value[res_nb]} <img src="img/{atq_array[mbr_race]}/res/{res_type}.png" alt="{res[{atq_array[mbr_race]}][alt][{res_type}]}" title="{res[{atq_array[mbr_race]}][alt][{res_type}]}" />
	 	  </foreach>
	 </div>
	 <hr />
	 <div id="atq_5" style="display:block;">
	 	[ <a href="index.php?file=war&act=cancel&aid={atq_aid}" title="Rappeler vos hommes">Annuler</a> ] 
		- 
		[  <a href="index.php?file=war&act=make_attack&aid={atq_aid}" title="Lancer l'attaque !">Attaquer</a> ]
	 </div>
	</div>
	</elseif>
	<else>
	  <h2 class="center">R�sum� de l'attaque contre {atq_array[mbr_pseudo]}</h2>
	  <div class="block_1">
	  <div id="atq_1" style="display:block;">
	  
	  <if cond="{atq_esp}">
	  Vos observateurs on �t�s d�couverts par {atq_array[mbr_pseudo]} !<br/><br/>
	  </if>
	  
	  <h2>Vous attaquez avec</h2>
	  <br/>
	 	<foreach cond='|{unt_array_mid1}| as |{unt_type}| => |{unt_value}|'>
	  	{unt_value[unt_nb]}<img src="img/{session_user[race]}/unt/{unt_type}.png" alt="{unt[{session_user[race]}][alt][{unt_type}]}" title="{unt[{session_user[race]}][alt][{unt_type}]}" />
	 	</foreach>
	 	<br />
	 	<strong>L�gion:</strong> {unt_array_mid1[{unt_type}][leg_name]}<br />
	 	<strong>Experience:</strong> {unt_array_mid1[{unt_type}][leg_xp]} (<math oper="floor({unt_array_mid1[{unt_type}][leg_xp]}/100)" />% <img src="img/{session_user[race]}/div/atq.png" alt="Bonus d'attaque" title="Bonus d'attaque" />)
	  <br/>
	  <strong>Bonus d'attaque total: </strong> {bilan_war[bonus_atq]}% <img src="img/{session_user[race]}/div/atq.png" alt="Bonus d'attaque" title="Bonus d'attaque" /><br/>
	  <strong>Force d'attaque contre les unit�s :</strong> {atq_array[atq_atq_unt]} (+<math oper="round({atq_array[atq_atq_unt]}*{bilan_war[bonus_atq]}/100)" />) <img src="img/{session_user[race]}/div/atq.png" alt="Attaque Unit�s" title="Attaque Unit�s" /><br/>
	  <strong>Force d'attaque contre les b�timents: </strong> {atq_array[atq_atq_btc]} (+<math oper="round({atq_array[atq_atq_btc]}*{bilan_war[bonus_atq]}/100)" />)  <img src="img/{session_user[race]}/div/atq_btc.png" alt="Attaque B�timents" title="Attaque B�timents" /><br/>
	  </div>
	  
	  <hr />
	  
	  <div id="atq_2" style="display:block;">
	  <h2>D�fense de {atq_array[mbr_pseudo]}</h2>
	  <strong>L�gions Aper�ues:</strong><br />
	  	<table class="border1">
	  		<tr>
	  		<th>Unit�s</th>
	  		<th>Nom</th>
	  		<th>Experience</th>
	  		<th>Bonus <img src="img/{session_user[race]}/div/def.png" alt="Bonus de d�fense" title="Bonus de d�fense" /></th>
	  		</tr>
	  	<if cond="is_array(|{unt_array_mid2}|)">
	  	<foreach cond='|{unt_array_mid2}| as |{unt_mid2_leg_lid}| => |{unt_mid2_leg_value}|'>
	  	<if cond='|{bilan_war[details_unt][{bilan_war[atq_mid2]}][{unt_mid2_leg_lid}]}|'>
	  	<tr>
	  	<td>
	  	<foreach cond='|{unt_mid2_leg_value}| as |{unt_type}| => |{unt_value}|'>
	  	{unt_value[unt_nb]}<img src="img/{atq_array[mbr_race]}/unt/{unt_type}.png" alt="{unt[{atq_array[mbr_race]}][alt][{unt_type}]}" title="{unt[{atq_array[mbr_race]}][alt][{unt_type}]}" />
	 	</foreach>
	 	</td>
	 	<td>{unt_value[leg_name]}</td>
	 	<td>{unt_value[leg_xp]}</td>
	 	<td>{bilan_war[bonus_def][leg][{unt_mid2_leg_lid}]} %</td>
	 	</tr>
	 	</if>
	 	</foreach>
	 	</if>
	 	</table>
	  <strong>B�timents Aper�us:</strong><br />
	  <foreach cond='|{bilan_war[btc_mid2_vus]}| as |{btc_type}| => |{btc_nb}|'>
	  {btc_nb} <img src="img/{atq_array[mbr_race]}/btc/{btc_type}.png" alt="{btc[{atq_array[mbr_race]}][alt][{btc_type}]}" title="{btc[{atq_array[mbr_race]}][alt][{btc_type}]}" />
	 </foreach>
	 	
	  <br />
	  <strong>Bonus de d�fense des b�timents: {bilan_war[bonus_def][btc]}% <img src="img/{atq_array[mbr_race]}/div/def.png" alt="Bonus de d�fense" title="Bonus de d�fense" /></strong> 
	  <br />
	  <strong>D�fense totale:</strong> {bilan_war[atq_def]} <img src="img/{atq_array[mbr_race]}/div/def.png" alt="D�fense" title="D�fense" /><br/>
	  </div>
	  
	  <hr />
	  
	  <div id="atq_3" style="display:block;">
	  <h2>Pertes</h2>
	  <strong>Votre arm�e re�oit {bilan_war[atq_def_eff]} points de d�g�ts...</strong>
	  <strong>Vous perdez {bilan_war[atq_morts]} soldat(s).</strong><br/>
	  <if cond='is_array(|{bilan_war[details_unt][{session_user[mid]}]}|)'>
	  <foreach cond='|{bilan_war[details_unt][{session_user[mid]}]}| as |{leg_lid}| => |{leg_value}|'>
	  	<foreach cond='|{leg_value}| as |{unt_type}| => |{unt_nb}|'>
	  	<if cond='|{unt_nb}| > 0'>
	  	{unt_nb}<img src="img/{session_user[race]}/unt/{unt_type}.png" alt="{unt[{session_user[race]}][alt][{unt_type}]}" title="{unt[{session_user[race]}][alt][{unt_type}]}" />
	  	</if>
	  	</foreach>
	  </foreach>
	  </if>
	  </div>
	  
	  <hr />
	  
	  <div id="atq_4" style="display:block;">
	  <h2>Tu�s</h2>
	  <strong>Vous infligez {bilan_war[atq_atq_unt_eff]} points de d�g�ts...</strong>
	  <strong>Vos soldats tuent {bilan_war[atq_tues]} soldat(s).</strong><br/>
	  <if cond='is_array(|{bilan_war[details_unt][{atq_array[atq_mid2]}]}|)'>
	  <foreach cond='|{bilan_war[details_unt][{atq_array[atq_mid2]}]}| as |{leg_lid}| => |{leg_value}|'>
	  	<foreach cond='|{leg_value}| as |{unt_type}| => |{unt_nb}|'>
	  	<if cond='|{unt_nb}| > 0'>
	  	{unt_nb} <img src="img/{atq_array[mbr_race]}/unt/{unt_type}.png" alt="{unt[{atq_array[mbr_race]}][alt][{unt_type}]}" title="{unt[{atq_array[mbr_race]}][alt][{unt_type}]}" />
	  	</if>
	  	</foreach>
	  </foreach>
	  </if>
	  </div>
	  
	  <hr />
	  
	  <div id="atq_5" style="display:block;">
	  <h2>B�timents D�truits</h2>
	  <strong>Vous infligez {bilan_war[atq_atq_btc_eff]} points de d�g�ts...</strong>
	  <br />
	  <if cond='is_array(|{bilan_war[details_btc]}|)'>
	  	<if cond='|{bilan_war[atq_btc]}| > 0'>
	  		Vos soldats d�truisent {bilan_war[atq_btc]} b�timent.<br/>
	  	</if>
	  	<foreach cond='|{bilan_war[details_btc]}| as |{btc_bid}| => |{btc_value}|'>
	  		<if cond="|{btc_value[btc_vie]}| <= 0">
	  		<img src="img/{atq_array[mbr_race]}/btc/{btc_value[btc_type]}.png" alt="{btc[{atq_array[mbr_race]}][alt][{btc_value[btc_type]}]}" title="{btc[{atq_array[mbr_race]}][alt][{btc_value[btc_type]}]}" />
	  		</if>
	  	</foreach>
	  	<br/>
	  	<if cond='|{bilan_war[atq_btc_end]}| > 0'>
	  		Vos soldats endommagent {bilan_war[atq_btc_end]} b�timent.<br/>
	  	</if>
	  	<foreach cond='|{bilan_war[details_btc]}| as |{btc_bid}| => |{btc_value}|'>
	  		<if cond="|{btc_value[btc_vie]}| > 0">
	  		{btc_value[btc_vie]}/{conf_mid2_btc[{btc_value[btc_type]}][vie]} <img src="img/{atq_array[mbr_race]}/btc/{btc_value[btc_type]}.png" alt="{btc[{atq_array[mbr_race]}][alt][{btc_value[btc_type]}]}" title="{btc[{atq_array[mbr_race]}][alt][{btc_value[btc_type]}]}" />
	  		</if>
	  	</foreach>
	  </if>
	  <else>
	  Aucun
	  </else>
	  </div>
	    
	  <hr />
	  
	  <div id="atq_6" style="display:block;">
	  <h2>Butin:</h2>
	  <if cond="|{bilan_war[atq_res1_nb]}| > 0">
	  <span class="gain">{bilan_war[atq_res1_nb]}</span><img src="img/{session_user[race]}/res/{bilan_war[atq_res1_type]}.png" alt="{res[{session_user[race]}][alt][{bilan_war[atq_res1_type]}]}" title="{res[{session_user[race]}][alt][{bilan_war[atq_res1_type]}]}" />
	  </if>
	  <if cond="|{bilan_war[atq_res2_nb]}| > 0">
	  <span class="gain">{bilan_war[atq_res2_nb]}</span><img src="img/{session_user[race]}/res/{bilan_war[atq_res2_type]}.png" alt="{res[{session_user[race]}][alt][{bilan_war[atq_res2_type]}]}" title="{res[{session_user[race]}][alt][{bilan_war[atq_res2_type]}]}" />	  
	  </if>
	  <br/>
	  Votre l�gion <if cond="|{bilan_war[leg_xp][{bilan_war[leg_lid]}]}| >= 0">gagne</if><else>perd</else>  {bilan_war[leg_xp][{bilan_war[leg_lid]}]} points d'xp.
	  </div>
	  
    	<div id="atq_7" style="display:block;">
    	<p class="{atq_result[{bilan_war[atq_result]}][css][0]}">{atq_result[{bilan_war[atq_result]}][text][0]}</p> 

    	</div>
    	<script type="text/javascript">
    	atq_hide(1);
    	setTimeout("atq_show(1)",1500);
    	</script>
    </div>
	</else>
</elseif>