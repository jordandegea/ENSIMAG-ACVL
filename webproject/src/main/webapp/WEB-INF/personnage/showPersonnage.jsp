<jsp:include page="../include/head.jsp" >
    <jsp:param name="title" value="Personnage ${personnage.nomPerso}"/>
</jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<h2>Personnage ${personnage.nomPerso}</h2>

<img src="${personnage.portrait}" alt="${personnage.portrait}"/>
<ul>
    <li>Nom : ${personnage.nomPerso}</li>
    <li>Date de naissance : ${personnage.dateNaiss}</li>
    <li>Profession : ${personnage.profession}</li>
    <li>Univers : ${personnage.univers}</li>
    <li>MJ : 
        <c:choose>
            <c:when test="${personnage.MJ != null}">
                ${personnage.MJ.login} <c:if test="${personnage.demandeMJ}"><i>(en attente de validation)</i></c:if> 
                <c:choose>
                    <c:when test="${peutchangerdemj != null}">
                        <form action="personnage" method="POST" accept-charset="UTF-8">
                            <input type="submit" onclick="return confirm('�tes-vous s�r de vouloir quitter ce MJ?')" value="Quitter ce MJ" />
                            <!-- Pour indiquer au contr?leur quelle action faire, on utilise un champ cach? -->
                            <input type="hidden" name="action" value="LEAVEMJ" />
                            <input type="hidden" name="idPerso" value="${personnage.id}" />
                        </form>
                    </c:when>
                    <c:otherwise>
                        <br />
                        Impossible de changer de MJ tant que vous �tes dans une partie en cours. 
                    </c:otherwise>
                </c:choose>
            </c:when>
            <c:otherwise>
                Pas de MJ
                <form action="personnage" method="GET" accept-charset="UTF-8">
                    <input type="submit" value="Proposer � un MJ" />
                    <!-- Pour indiquer au contr?leur quelle action faire, on utilise un champ cach? -->
                    <input type="hidden" name="action" value="FINDMJ" />
                    <input type="hidden" name="idPerso" value="${personnage.id}" />
                </form>
            </c:otherwise>
        </c:choose>
    </li>
    <li>Biographie </li>
        ${personnage.biographie.getParagraphesBiographieAll()}
</ul>

<!-- Ici saisie des �pisodes -->
<form action="personnage" method="GET" accept-charset="UTF-8">

    <h3> Nouvel Episode </h3> 
    <div class="form-group">
        <input type="button" class="btn btn-primary" onClick="addTextArea()" value="Ajouter Un Paragraphe"/>
        <div id="ajout">
            <br/>
            <label class="col-lg-2 control-label"></label>
            <div class="form-group">
                <textarea class="form-control" name="paragraphe1" required></textarea>
                <label class="col-lg-2 control-label"></label><label><input type="checkbox" id="isPrivate1" name="isPrivate1" value="isPrivate1"> Paragraphe Priv�</label>
            </div>
        </div>
    </div>

    <input type="submit" value="Valider  l'�pisode de transition" />
    <!-- Pour indiquer au contr�leur quelle action faire, on utilise un champ cach� -->
    <input type="hidden" name="action" value="NEWTRANSI" />
    <input type="hidden" name="idPerso" value="${personnage.id}" />
</form>

<h2>Parties</h2>
<ul>
    <c:forEach items="${personnage.parties}" var="partie">
        <li>${partie} - <a href='partie?action=SHOW&idPartie=${partie.id}'>voir</a></li>
        </c:forEach>
</ul>


<form action="personnage" method="GET" accept-charset="UTF-8">
    <input type="submit" value="Transf�rer Personnage" />
    <input type="hidden" name="action" value="TRANSFER" />
    <input type="hidden" name="idPerso" value="${personnage.id}" />
</form>

</form>
<form action="joueur" method="GET" accept-charset="UTF-8">
    <input type="submit" value="Retour" />
    <!-- Pour indiquer au contr?leur quelle action faire, on utilise un champ cach? -->
    <input type="hidden" name="action" value="SHOW" />
</form>


<script type="text/javascript" src="../public/js/formularise.js">
</script>

<script type="text/javascript">
    var nbParagraphes = 1;

    function addTextArea() {
      nbParagraphes = nbParagraphes + 1;
      $("#ajout").append('<label class="col-lg-2 control-label"></label><div class="form-group"><textarea class="form-control" name="paragraphe' + nbParagraphes + '" required></textarea><label class="col-lg-2 control-label"></label><label><input type="checkbox" id="isPrivate' + nbParagraphes + '" name="isPrivate' + nbParagraphes + '" value="isPrivate' + nbParagraphes + '"> Paragraphe Priv�</label></div>');

    }
</script>

<jsp:include page="../include/foot.jsp" />
