<h2>Les titres honorifiques</h2>
<p>
Il existe de nombreux titres honorifiques sur Zordania, qui sont d�livr�s en cas de services rendus � la nation.
</p>

<dl>
<dt><img src="img/groupes/8.png" alt="{groupes[8]}" title="{groupes[8]}"/>{groupes[8]}</dt>
<dd>
Ce titre est celui de l'administrateur de Zordania. 
C'est le titre le plus haut qui puisse �tre d�cern�.<br />
Les administrateurs sonts la pour r�gler tout les bugs et probl�mes de zordania. Ils �coutent aussi les suggestions et s'en serve pour am�liorer sans cesse le jeu.
</dd>
<dt><img src="img/groupes/7.png" alt="{groupes[7]}" title="{groupes[7]}"/>{groupes[7]}</dt>
<dd>
Ce titre est celui de co-administrateur de Zordania. 
Chef des mod�rateur, il aide les administrateur a comprendre les m�canismes du jeu aux yeux des joueurs.
</dd>
<dt><img src="img/groupes/6.png" alt="{groupes[6]}" title="{groupes[6]}"/>{groupes[6]}<img src="img/groupes/5.png" alt="{groupes[5]}" title="{groupes[5]}"/>{groupes[5]}</dt>
<dd>
Ce titre est celui de Mod�rateur du forum de Zordania. 
Les personnes charg�es d'organiser, de surveiller et de stimuler le forum de Zordania recoivent le titre de Mod�rateur.
</dd>

<dt><img src="img/groupes/4.png" alt="{groupes[4]}" title="{groupes[4]}"/>{groupes[4]}</dt>
<dd>
Joueurs les plus respectables.
</dd>
</dl>

<h2>Les R�compenses</2>
<dl>
<foreach cond="|{recompense}| as |{rec_type}| => |{rec_name}|">
	<dt><img src="img/rec/{rec_type}.png" title="{rec_name}" alt="{rec_name}" /></dt>
	<dd>{rec_name}</dd>
</foreach>
</dl>