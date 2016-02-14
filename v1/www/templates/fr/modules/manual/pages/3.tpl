<h2>Unit�s</h2>
<p>
Il existe deux types d�unit�s dans Zordania : les unit�s civiles et les unit�s militaires ... <br/>
Le maximum d'unit�s qu'il est possible de former, civiles et militaires confondues, est de {GAME_MAX_UNT_TOTAL}.
</p>
<dl>
<dt>Les unit�s civiles</dt>
<dd>
Elles permettent de g�rer, construire et d�velopper le village. 
Certaines de ces unit�s peuvent �tres assign�es � des b�timents et y travailler. Elles ne peuvent plus faire autre chose, 
et la destruction du b�timent d�truit aussi les unit�s qui y �taient assign�s. 
<br />Toutes les unit�s peuvent �tre pendues, donc tu�es, sauf celles travaillant dans un b�timent. 
Le fait de pendre une unit� rapporte la moiti� de son co�t d'origine.
</dd>
<dt>Les unit�s militaires</dt>
<dd>
Ce sont vos soldats. Ils sont affect�s dans des l�gions que vous pouvez g�rer et nommer, 
et qui servent � attaquer d'autres villages. 
<br />
<if cond="|{man_race}| != 3">
La lev�e d'une arm�e se fait gr�ce aux recrues. 
Elles sont n�cessaires pour cr�er des unit�s militaires. G�n�ralement, les machines de guerre demandent 
m�me plusieurs recrues pour �tre construites.
</if>
<else>
Il y a plusieurs niveaux d'unit�s militaires. Les plus basiques, qui n�cessitent un 
entrainement peu pointu, sont form�es � la caserne. Elles n�cessite donc d'abord la cr�ation d'une recrue.
<br>Les unit�s plus exp�riment�es sont form�es � l'�cole militaire. Suivant la qualit� de la formation, un v�t�ran ou un h�ros 
sera n�cessaire � la cr�ation de l'unit� militaire d�sir�e.
</else>
</dd>
</dl>

<h3>La production</h3>
<p>
<if cond="|{man_race}| != 2">
Les unit�s civiles sont produites � raison d'une unit� par tour, sauf si vous poss�dez une 
forteresse, une cit� noire ou une citadelle. En effet, dans ce cas, la production passe � deux par tour.
</if>
<else>
Les unit�s civiles sont produites � raison de deux unit�s par tour, sauf si vous poss�dez un 
fortin. En effet, dans ce cas, la production passe � trois par tour.
</else>
<br />
Le nombre d'unit�s militaires que vous pouvez former simultan�ment d�pend du nombre de b�timents ad�quats que vous poss�dez. Par exemple, 
si vous poss�dez deux casernes, vous pourrez cr�er deux unit�s de l'onglet "caserne" par tour.
</p>

<h3>La nourriture <img src="img/{man_race}/res/{GAME_RES_BOUF}.png" alt="{res[{man_race}][alt][{GAME_RES_BOUF}]}" title="{res[{man_race}][alt][{GAME_RES_BOUF}]}" /></h3>
<p>
Chaque unit� mange une unit� de nourriture par tour.
<br />Si vous tombez � court de nourriture, vos unit�s mourront de faim. 
Les unit�s civiles affect�es dans des b�timents ne peuvent cependant pas mourir de faim, 
mais vos l�gions risquent vite d'�tre d�cim�es si vous ne faites rien pour stopper la famine qui s�vit.
</p>
