<p class="menu_module">
[
<a href="index.php?file=war&amp;act=histo" title="Historique de vos attaques, et de celle de vos ennemis.">Journal de guerre</a>
]
- 
[
<a href="index.php?file=leg" title="Cr�er, Modifier, D�placer vos L�gions">Gestion des L�gions</a>
] -
[
<a href="index.php?file=war&amp;act=atq" title="Attaquer un autre membre.">Attaquer</a>
] -
[
<a href="index.php?file=war&amp;act=enc" title="Voir les attaques en cours.">Attaques en cours</a>
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
		vous n'avez pas assez de points (il faut au minimum {atq_min_pts}).
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
			<if cond='|{leg_value[leg_etat]}| == 0'>
			<set name="nb_leg" value="<maths oper='{nb_leg}+1' />" />
			<div class="list_univ">
				<input style="float: left;" type="radio" name="lid" value=" {leg_id}" />
  				L�gion {leg_id} - Nom {leg_value[leg_name]}<br />
				Experience : {leg_value[leg_xp]} 
				 <br />
					<if cond='is_array(|{unt_array[{leg_id}]}|)'>
						<foreach cond='|{unt_array[{leg_id}]}| as |{unt_type}| => |{unt_value}|'>
						{unt_value[unt_nb]} <img src="img/{session_user[race]}/unt/{unt_type}.png" alt="{unt[alt][{unt_type}]}" title="{unt[alt][{unt_type}]}" />
						</foreach>
					</if>
					<else>
						<br />Aucune unit� dans cette L�gion - <a href="index.php?file=leg&act=del_leg&lid={leg_id}" title="Supprimer cette l�gion">Supprimer</a>
				
					</else>
				</div>
				</if>
			</foreach>
			<if cond='!|{nb_leg}|'>
			<p class="infos">Vous n'avez aucune l�gion libre ! </p>
			</if>
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
   <div class="list_univ">
   <if cond='|{result[atq_mid]}| != |{user_mid}|'>
    <h3><img src="img/{session_user[race]}/div/def.png" alt="def" title="Vous avez �t� attaqu�" /> Vous avez �t� attaqu� par {result[mbr_pseudo]}</h3>
    <if cond='(|{result[atq_atq_btc]}| < |{result[atq_def]}|) OR (|{result[atq_tues]}| AND |{result[atq_atq_unt]}| <  |{result[atq_def]}|)'>
    	<div class="victoire">Victoire</div>
    </if>
    <elseif cond='|{result[atq_btc]}| > 0'>
    	<div class="defaite">D�faite Partielle</div>
    </elseif>
    <else>
    	<div class="defaite">D�faite</div> 
    </else>
    Date : {result[atq_date_arv_formated]}
    <br/>
    Force d'attaque :
    <ul>
     <li>Unit�s: {result[atq_atq_unt]} <img src="img/{session_user[race]}/div/atq.png" alt="Attaque Unit�s" title="Attaque Unit�s" /></li>
     <li>B�timents: {result[atq_atq_btc]} <img src="img/{session_user[race]}/div/atq_btc.png" alt="Attaque B�timents" title="Attaque B�timents" /></li>
    </ul>
    D�fense : {result[atq_def]} <img src="img/{session_user[race]}/div/def.png" alt="D�fense" title="D�fense" /><br/>
    ---<br/>
    Tu�s : {result[atq_morts]}
    <if cond='is_array(|{result[atq_unt_mid1]}|)'>
	<foreach cond='|{result[atq_unt_mid1]}| as |{leg_lid}| => |{leg_value}|'>
	 <foreach cond='|{leg_value}| as |{unt_type}| => |{unt_nb}|'>
	  <if cond='|{unt_nb}| > 0'>
	   {unt_nb}<img src="img/{session_user[race]}/unt/{unt_type}.png" alt="{unt[alt][{unt_type}]}" title="{unt[alt][{unt_type}]}" />
	  </if>
	 </foreach>
	</foreach>
    </if><br/>
    Pertes : <br/>
    <ul>
     <li>
     	Unit�s: {result[atq_tues]}
     	<if cond='is_array(|{result[atq_unt_mid2]}|)'>
	<foreach cond='|{result[atq_unt_mid2]}| as |{leg_lid}| => |{leg_value}|'>
	 <foreach cond='|{leg_value}| as |{unt_type}| => |{unt_nb}|'>
	  <if cond='|{unt_nb}| > 0'>
	   {unt_nb}<img src="img/{result[mbr_race]}/unt/{unt_type}.png" alt="{unt[alt][{unt_type}]}" title="{unt[alt][{unt_type}]}" />
	  </if>
	 </foreach>
	</foreach>
        </if>
    </li>
     <li>
        B�timents: {result[atq_btc]}
        <if cond='is_array(|{result[atq_btc_mid2]}|)'>
        <foreach cond='|{result[atq_btc_mid2]}| as |{btc_bid}| => |{btc_value}|'>
		<if cond="|{btc_value[btc_vie]}| <= 0">
		<img src="img/{result[mbr_race]}/btc/{btc_value[btc_type]}.png" alt="B�timent d�truit" />
		</if>
	</foreach>
	</if>
     </li>
    </ul>
    Pillages : {result[atq_res1_nb]}<img src="img/{session_user[race]}/res/{result[atq_res1_type]}.png" alt="{res[alt][{result[atq_res1_type]}]}" title="{res[alt][{result[atq_res1_type]}]}" />
    Butin : {result[atq_res2_nb]}<img src="img/{session_user[race]}/res/{result[atq_res2_type]}.png" alt="{res[alt][{result[atq_res2_type]}]}" title="{res[alt][{result[atq_res2_type]}]}" />
   </if>
   <else>
    <h3><img src="img/{session_user[race]}/div/atq.png" alt="atq" title="Vous attaquez" />Vous avez attaqu� {result[mbr_pseudo]}</h3>
    <if cond='(|{result[atq_atq_btc]}| > |{result[atq_def]}|) OR (|{result[atq_tues]}| AND |{result[atq_atq_unt]}| >  |{result[atq_def]}|)'>
    	<div class="victoire">Victoire</div>
    </if>
    <elseif cond='|{result[atq_btc]}| > 0'>
    	<div class="victoire">Victoire Partielle</div>
    </elseif>
    <else>
    	<div class="defaite">D�faite</div> 
    </else>
    L�gion : {result[leg_name]}<br/>
    Date de D�part : {result[atq_date_dep_formated]}
    <br/>Date de la bataille : {result[atq_date_arv_formated]}
    <br/>
    ---<br/>
    Force d'attaque :
    <ul>
     <li>Unit�s: {result[atq_atq_unt]}  <img src="img/{session_user[race]}/div/atq.png" alt="Attaque Unit�s" title="Attaque Unit�s" /></li>
     <li>B�timents: {result[atq_atq_btc]}  <img src="img/{session_user[race]}/div/atq_btc.png" alt="Attaque B�timents" title="Attaque B�timents" /></li>
    </ul>
    D�fense : {result[atq_def]} <br/>
    ---<br/>
    Pertes : {result[atq_morts]}
    <if cond='is_array(|{result[atq_unt_mid1]}|)'>
	<foreach cond='|{result[atq_unt_mid1]}| as |{leg_lid}| => |{leg_value}|'>
	 <foreach cond='|{leg_value}| as |{unt_type}| => |{unt_nb}|'>
	  <if cond='|{unt_nb}| > 0'>
	   {unt_nb}<img src="img/{session_user[race]}/unt/{unt_type}.png" alt="{unt[alt][{unt_type}]}" title="{unt[alt][{unt_type}]}" />
	  </if>
	 </foreach>
	</foreach>
    </if>
    <br/>
    D�truit : <br/>
    <ul>
     <li>
     	Unit�s: {result[atq_tues]}
     	<if cond='is_array(|{result[atq_unt_mid2]}|)'>
	<foreach cond='|{result[atq_unt_mid2]}| as |{leg_lid}| => |{leg_value}|'>
	 <foreach cond='|{leg_value}| as |{unt_type}| => |{unt_nb}|'>
	  <if cond='|{unt_nb}| > 0'>
	   {unt_nb}<img src="img/{result[mbr_race]}/unt/{unt_type}.png" alt="{unt[alt][{unt_type}]}" title="{unt[alt][{unt_type}]}" />
	  </if>
	 </foreach>
	</foreach>
        </if>
    </li>
     <li>
        B�timents: {result[atq_btc]}
        <if cond='is_array(|{result[atq_btc_mid2]}|)'>
        <foreach cond='|{result[atq_btc_mid2]}| as |{btc_bid}| => |{btc_value}|'>
		<if cond="|{btc_value[btc_vie]}| <= 0">
		<img src="img/{result[mbr_race]}/btc/{btc_value[btc_type]}.png" alt="B�timent d�truit" />
		</if>
	</foreach>
	</if>
     </li>
    </ul>
    Butin : {result[atq_res1_nb]}<img src="img/{session_user[race]}/res/{result[atq_res1_type]}.png" alt="{res[alt][{result[atq_res1_type]}]}" title="{res[alt][{result[atq_res1_type]}]}" />
   </else>
   </div> 	    
 </foreach>

  <br />Page : 
  <for cond='|{i}| = 0; |{i}| < |{atq_nb}|; |{i}|+=|{limite_page}|'>
   <if cond='|{i}| / |{limite_page}| != |{war_page}|'>
   <a href="index.php?file=war&amp;act=histo&amp;war_page=<math oper='({i} / {limite_page})' />"><math oper='(({i} / {limite_page})+1)' /></a>
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
    Temps avant attaque : <math oper='ceil({result[atq_dst]} / {result[atq_speed]})' />H<br />
    ---<br/>
    Force d'attaque :
    <ul>
     <li>Unit�s: {result[atq_atq_unt]} <img src="img/{session_user[race]}/div/atq.png" alt="Attaque Unit�s" title="Attaque Unit�s" /></li>
     <li>B�timents: {result[atq_atq_btc]} <img src="img/{session_user[race]}/div/atq_btc.png" alt="Attaque B�timents" title="Attaque B�timents" /></li>
    </ul>
    ---<br/>
    [ <a href="index.php?file=war&amp;act=cancel&amp;aid={result[atq_aid]}" title="Rappeler vos hommes">Annuler</a> ]
    <if cond='|{result[mbr_atq_nb]}| >= |{ATQ_NB_MAX_PER_DAY}|'>
    - Barre des {ATQ_NB_MAX_PER_DAY} attaques journali�res depass�e pour ce membre.
    </if>
    <elseif cond='|{result[atq_dst]}| == 0'>
    [
     <a href="index.php?file=war&amp;act=make_attack&amp;sub=esp&amp;aid={result[atq_aid]}" title="R�cup�rer des informations sur les d�fenses de l'ennemi !">Espionner</a>
    ]
    -
    [ 
    <a href="index.php?file=war&amp;act=make_attack&amp;aid={result[atq_aid]}" title="Lancer l'attaque !">Attaquer</a>
    ] - Attaques possibles aujourd'hui: <math oper="({result[mbr_atq_nb]}-{ATQ_NB_MAX_PER_DAY})" />/{ATQ_NB_MAX_PER_DAY}
    </elseif>
   </else>
   </div> 	    
 </foreach>

  <br />Page : 
  <for cond='|{i}| = 0; |{i}| < |{atq_nb}|; |{i}|+=|{limite_page}|'>
   <if cond='|{i}| / |{limite_page}| != |{war_page}|'>
   <a href="index.php?file=war&amp;act=enc&amp;war_page=<math oper='({i} / {limite_page})' />"><math oper='(({i} / {limite_page})+1)' /></a>
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
	<p class="infos">Le village �tait abandonn� depuis des si�cles, la l�gion est sur le chemin du retour ...</p>
	</elseif>
	<elseif cond='|{atq_esp_ok}| == true'>
	 <p class="infos">
	 Estimations de vos observateurs 
		<if cond="|{bilan_war[mid2_def_unt]}| > 0">
		<img src="img/{session_user[race]}/div/atq.png" alt="D�fense Unit�s" title="D�fense Unit�s" />
		{bilan_war[mid2_def_unt]}
		</if>
		<else>
		<img src="img/{session_user[race]}/div/atq_btc.png" alt="D�fense B�timents" title="D�fense B�timents" />
		{bilan_war[mid2_def_btc]}
		</else>
		.<br/>
		 [ <a href="index.php?file=war&amp;act=cancel&amp;aid={atq_aid}" title="Rappeler vos hommes">Annuler</a> ] 
		 - 
		 [  <a href="index.php?file=war&amp;act=make_attack&amp;aid={atq_aid}" title="Lancer l'attaque !">Attaquer</a> ]
	 </p>
	</elseif>
	<else>
	  <h2 class="center">R�sum� de l'attaque contre {atq_array[mbr_pseudo]}</h2>
	  <div class="block_1">
	  <p>
	  
	  <if cond="{atq_esp}">
	  Vos observateurs on �t�s d�couverts par {atq_array[mbr_pseudo]} !<br/><br/>
	  </if>
	  
	  Vous attaquez avec :<br/>
	 	<foreach cond='|{unt_array}| as |{unt_type}| => |{unt_value}|'>
	  	{unt_value[unt_nb]}<img src="img/{session_user[race]}/unt/{unt_type}.png" alt="{unt[alt][{unt_type}]}" title="{unt[alt][{unt_type}]}" />
	 	</foreach>
	  <br/><br/>
	  Force d'attaque contre les unit�s : {atq_array[atq_atq_unt]}  <img src="img/{session_user[race]}/div/atq.png" alt="Attaque Unit�s" title="Attaque Unit�s" /><br/>
	  Force d'attaque contre les b�timents : {atq_array[atq_atq_btc]}  <img src="img/{session_user[race]}/div/atq_btc.png" alt="Attaque B�timents" title="Attaque B�timents" /><br/>
	  <if cond='{bilan_war[bonus_atq]}'>
	  Bonus d'attaque : {bilan_war[bonus_atq]} 
	  </if>
	  </p>
	  
	  <p>
	  D�fense de {atq_array[mbr_pseudo]} : {bilan_war[atq_def]} <img src="img/{session_user[race]}/div/def.png" alt="D�fense" title="D�fense" /><br/>
	  <if cond='{bilan_war[bonus_def]}'>
	  Bonus de d�fense : {bilan_war[bonus_def]}
	  </if>
	  </p>
	  
	  <p>
	  Vous perdez {bilan_war[atq_morts]} soldat(s).<br/>
	  <if cond='is_array(|{bilan_war[details_unt][{session_user[mid]}]}|)'>
	  <foreach cond='|{bilan_war[details_unt][{session_user[mid]}]}| as |{leg_lid}| => |{leg_value}|'>
	  	<foreach cond='|{leg_value}| as |{unt_type}| => |{unt_nb}|'>
	  	<if cond='|{unt_nb}| > 0'>
	  	{unt_nb}<img src="img/{session_user[race]}/unt/{unt_type}.png" alt="{unt[alt][{unt_type}]}" title="{unt[alt][{unt_type}]}" />
	  	</if>
	  	</foreach>
	  </foreach>
	  </if>
	  </p>
	  
	  <if cond='|{session_user[race]}| != |{atq_array[mbr_race]}|'>
	  	<load file="race/{atq_array[mbr_race]}.config" />
	  </if>	
	  <p>
	  Vos soldats tuent {bilan_war[atq_tues]} soldat(s).<br/>
	  <if cond='is_array(|{bilan_war[details_unt][{atq_array[atq_mid2]}]}|)'>
	  <foreach cond='|{bilan_war[details_unt][{atq_array[atq_mid2]}]}| as |{leg_lid}| => |{leg_value}|'>
	  	<foreach cond='|{leg_value}| as |{unt_type}| => |{unt_nb}|'>
	  	<if cond='|{unt_nb}| > 0'>
	  	{unt_nb} <img src="img/{atq_array[mbr_race]}/unt/{unt_type}.png" alt="Type: {unt_type}" />
	  	</if>
	  	</foreach>
	  </foreach>
	  </if>
	  </p>
	  
	  <p>
	  <if cond='is_array(|{bilan_war[details_btc]}|)'>
	  	<if cond='|{bilan_war[atq_btc]}| > 0'>
	  		Vos soldats d�truisent {bilan_war[atq_btc]} b�timent.<br/>
	  	</if>
	  	<foreach cond='|{bilan_war[details_btc]}| as |{btc_bid}| => |{btc_value}|'>
	  		<if cond="|{btc_value[btc_vie]}| <= 0">
	  		<img src="img/{atq_array[mbr_race]}/btc/{btc_value[btc_type]}.png" alt="B�timent d�truit" />
	  		</if>
	  	</foreach>
	  	<br/>
	  	<if cond='|{bilan_war[atq_btc_end]}| > 0'>
	  		Vos soldats endommagent {bilan_war[atq_btc_end]} b�timent.<br/>
	  	</if>
	  	<foreach cond='|{bilan_war[details_btc]}| as |{btc_bid}| => |{btc_value}|'>
	  		<if cond="|{btc_value[btc_vie]}| > 0">
	  		<img src="img/{atq_array[mbr_race]}/btc/{btc_value[btc_type]}.png" alt="B�timent endommag�" />
	  		</if>
	  	</foreach>
	  </if>
	  </p>  
	  
	  <p>
	  <strong>Butin:</strong>
	  	{bilan_war[atq_res1_nb]}<img src="img/{session_user[race]}/res/{bilan_war[atq_res1_type]}.png" alt="{res[alt][{bilan_war[atq_res1_type]}]}" title="{res[alt][{bilan_war[atq_res1_type]}]}" />
	  <br/>
	  <strong>Vos Soldats Laissent:</strong>
	  	{bilan_war[atq_res2_nb]}<img src="img/{session_user[race]}/res/{bilan_war[atq_res2_type]}.png" alt="{res[alt][{bilan_war[atq_res2_type]}]}" title="{res[alt][{bilan_war[atq_res2_type]}]}" />	  
	  
	  <if cond="|{bilan_war[atq_prod_nb]}| > 0">
	  <br/><strong>Bonus:</strong>
	  	{bilan_war[atq_prod_nb]}<img src="img/{session_user[race]}/res/{bilan_war[atq_prod_type]}.png" alt="{res[alt][{bilan_war[atq_prod_type]}]}" title="{res[alt][{bilan_war[atq_prod_type]}]}" />
	  </if>
	  </p>
	  
    <if cond='(|{atq_array[atq_atq_btc]}| > |{bilan_war[atq_def]}| AND !|{bilan_war[atq_tues]}|) OR (|{bilan_war[atq_tues]}| AND |{atq_array[atq_atq_unt]}| >  |{bilan_war[atq_def]}|)'>
    	<div class="victoire">Victoire</div>
    </if>
    <elseif cond='|{bilan_war[atq_btc]}| > 0'>
    	<div class="defaite">D�faite Partielle</div>
    </elseif>
    <else>
    	<div class="defaite">D�faite</div> 
    </else>
    </div>
	</else>
</elseif>