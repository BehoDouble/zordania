<if cond='|{btc_act}| == "list" OR !|{btc_act}|'>
 <if cond='is_array(|{btc_array}|)'>
  <if cond='|{btc_counter}| = 0'>
  </if>
  <foreach cond='|{btc_array}| AS |{btc_id}| => |{btc_vars}|'>
  	<div class="list30">
  	<img style="align: left" src="img/{session_user[race]}/btc/{btc_id}.png" alt="{btc[alt][{btc_id}]}" title="{btc[alt][{btc_id}]}" /> 
  	{btc[alt][{btc_id}]} ({btc_vars[btc_nb]})<br /> 
  	<br /><p class="menu_module">
  	[
  	<a href="index.php?file=btc&amp;act=use&amp;sub=list&amp;btc_type={btc_id}" title="Voir la liste des b�timents de ce type">Liste</a>
  	-
  	<a href="index.php?file=btc&amp;act=use&amp;btc_type={btc_id}" title="Gerer {btc[alt][{btc_id}]}">Gerer</a>
  	]
  	</p>
  	</div>
  	<if cond='|{btc_counter}|++'>
  	</if>
  	<if cond='|{btc_counter}| == 3'>
  	    	<div class="cleaner">
  		</div>
  		<if cond='|{btc_counter}| = 0'>
  		</if>
  	</if>
  </foreach>
  <div class="cleaner">
  </div>
 </if>
</if>
<elseif cond='|{btc_act}| == "list2"'>
 <if cond='is_array(|{btc_array}|) AND |{btc_id}|'>
  <foreach cond='|{btc_array}| AS |{btc_bid}| => |{btc_vars}|'>
  	<br />
  	<img style="align: left" src="img/{session_user[race]}/btc/{btc_id}.png" alt="{btc[alt][{btc_id}]}" title="{btc[alt][{btc_id}]}" /> 
  	Solidit� : <math oper='round(({btc_vars[btc_vie]} / ({btc_vie})*100))' /> % | Etat : {btc_etat[{btc_vars[btc_etat]}]}<br /> 
  	<div class="barres_grandes">
  	 <div style="width:<math oper='floor(100-(({btc_vars[btc_vie]} / ({btc_vie}+1))*100))' />%" class="barre_rouge"></div>
  	 <div style="width:<math oper='floor(({btc_vars[btc_vie]} / ({btc_vie}+1))*100)' />%" class="barre_verte"></div>
        </div>&nbsp;<em>{btc_vars[btc_vie]}/{btc_vie}</em>
        <a href="index.php?file=btc&amp;act=use&amp;btc_bid={btc_bid}&amp;sub=det" title="D�truire le B�timent et r�cup�rer la moiti� des ressources">D�truire</a>
        - 
        <if cond="|{btc_vars[btc_etat]}| == 0">
        <a href="index.php?file=btc&amp;act=use&amp;btc_bid={btc_bid}&amp;sub=des" title="D�sactiver le B�timent">D�sactiver</a>
        </if>
        <else>
        <a href="index.php?file=btc&amp;act=use&amp;btc_bid={btc_bid}&amp;sub=act" title="Activer le B�timent">Activer</a>
        </else>
        <if cond="|{btc_vars[btc_vie]}| - |{btc_vie}| != 0 AND |{btc_vars[btc_etat]}| != 1">
        - <a href="index.php?file=btc&amp;act=use&amp;btc_bid={btc_bid}&amp;sub=rep" title="R�parer le B�timent (le rend inutilisable durant la r�paration)">R�parer</a>
        </if>
        <br />
  	
  </foreach>
 </if>
 <elseif cond='is_array(|{btc_array}|)'>
  <foreach cond='|{btc_array}| AS |{btc_bid}| => |{btc_vars}|'>
  	<br />
  	<img style="align: left" src="img/{session_user[race]}/btc/{btc_vars[btc_type]}.png" alt="{btc[alt][{btc_vars[btc_type]}]}" title="{btc[alt][{btc_vars[btc_type]}]}" /> 
  	<set name="btc_vie" value="{btc_conf[{btc_vars[btc_type]}][vie]}" />
  	{btc[alt][{btc_id}]}<br /> 
  	Solidit� : <math oper='round(({btc_vars[btc_vie]} / ({btc_vie})*100))' /> % | Etat : {btc_etat[{btc_vars[btc_etat]}]}<br /> 
  	<div class="barres_grandes">
  	 <div style="width:<math oper='floor(100-(({btc_vars[btc_vie]} / {btc_vie})*100))' />%" class="barre_rouge"></div>
  	 <div style="width:<math oper='floor(({btc_vars[btc_vie]} / {btc_vie})*100)' />%" class="barre_verte"></div>
        </div>&nbsp;<em>{btc_vars[btc_vie]}/{btc_vie}</em>
        <a href="index.php?file=btc&amp;act=use&amp;btc_bid={btc_bid}&amp;sub=det" title="D�truire le B�timent et r�cup�rer la moiti� des ressources">D�truire</a>
         - 
        <if cond="|{btc_vars[btc_etat]}| == 0">
        <a href="index.php?file=btc&amp;act=use&amp;btc_bid={btc_bid}&amp;sub=des" title="D�sactiver le B�timent">D�sactiver</a>
        </if>
        <else>
        <a href="index.php?file=btc&amp;act=use&amp;btc_bid={btc_bid}&amp;sub=act" title="Activer le B�timent">Activer</a>
        </else><if cond="|{btc_vars[btc_vie]}| - |{btc_vie}| != 0 AND |{btc_vars[btc_etat]}| != 1">
        - <a href="index.php?file=btc&amp;act=use&amp;btc_bid={btc_bid}&amp;sub=rep" title="R�parer le B�timent (le rend inutilisable durant la r�paration)">R�parer</a>
        </if>
        <br />
  	
  </foreach>
 </else>
 
</elseif>
<elseif cond='|{btc_act}| == "vue"'>
 <if cond='is_array(|{btc_array}|)'>
  <div class="village">
  <foreach cond='|{btc_array}| AS |{btc_bid}| => |{btc_vars}|'>
  	<a href="index.php?file=btc&amp;act=use&amp;btc_type={btc_vars[btc_type]}">
  	<img src="img/{session_user[race]}/btc/{btc_vars[btc_type]}.png" alt="{btc[alt][{btc_vars[btc_type]}]}" title="{btc[alt][{btc_vars[btc_type]}]}" /> 
  	</a>
  </foreach>
 	</div>
 </if>
 
</elseif>
<elseif cond='|{btc_act}| == "det"'>
	<if cond='|{btc_ok}| == true'>
		<if cond='|{btc_no_bid}| == true'>
 		<p class="error">Aucun b�timent s�lectionn�.</p>
 		</if>
 		<elseif cond='|{btc_det_ok}| == true'>
 		<p class="ok">Ok B�timent d�truit.</p>
 		</elseif>
 		<elseif cond='|{btc_det_ok}| == false'>
 		<p class="error">Ce b�timent n'existe pas ou ne peu pas �tre d�truit.</p>
 		</elseif>
 	</if>
	<else>
	�tes vous sur de vouloir d�truire ce b�timent ? <br />
	[ 
	<a href="index.php?file=btc&amp;act=use&amp;btc_bid={btc_bid}&amp;sub=det&amp;ok=ok" title="oui">Oui</a>
	] - [
	<a href="index.php?file=btc" title="Non">Non</a>
	]
	</else>
</elseif>
<elseif cond='|{btc_act}| == "mod_etat"'>
	<if cond='|{btc_no_bid}| == true'>
 		<p class="error">Aucun b�timent selection�..</p>
 	</if>
 	<elseif cond='|{btc_mod_etat}| == true'>
 		<p class="ok">Ok action effectu�e.</p>
 	</elseif>
 	<elseif cond='|{btc_mod_etat}| == false'>
 		<p class="error">Ce B�timent n'existe pas.</p>
 	</elseif>
</elseif>
<elseif cond='|{btc_act}| == "no_btc"'>
	<br />
	<p class="infos">Vous ne possedez pas encore le b�timent pour effectuer cette action ({btc[alt][{btc_id}]}).
	<br/>Il est aussi possible que ce b�timent soit en r�paration ou inactif.</p>
</elseif>

<if cond='isset(|{btc_tpl}|)'>
	<h2><img style="align: left" src="img/{session_user[race]}/btc/{btc_id}.png" alt="btc_img" title="{btc[alt][{btc_id}]}" /> {btc[alt][{btc_id}]}</h2>
	{btc[descr][{btc_id}]} <hr />
	<br/>
	<include file="{btc_tpl}" cache="1" />
</if>

<br /><br />
<p class="retour_module">
<if cond='|{btc_act}| == "use"'>
[ <a href="index.php?file=btc&amp;act=use&amp;type={btc_type}" title="Retour">Retour</a>
]
</if>
<else>
[ <a href="index.php?file=btc&amp;act=use" title="Retour">Retour</a>
]  
<if cond='|{btc_tpl}|'>
- [ <a href="index.php?file=btc&amp;act=use&amp;btc_type={btc_id}" title="Retour vers {btc[alt][{btc_id}]}">{btc[alt][{btc_id}]}</a>
]
</if> 
<else>
- [ <a href="index.php?file=btc&amp;&amp;act=use&amp;sub=list" title="Liste compl�te de tout les b�timents">Liste compl�te</a>
]
- [ <a href="index.php?file=btc&amp;&amp;act=use&amp;sub=vue" title="Vue g�n�rale">Vue g�n�rale</a>
]
</else>
</else>
</p>