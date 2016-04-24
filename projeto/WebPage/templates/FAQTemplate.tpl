<body>
      <!-- Navigation -->
      <?php
        include 'common/head.php';
        include 'common/bar.php';
      ?>
    <div class="container">
        <div class="panel-group" id="accordion">
            <div class="faqHeader">Questões Gerais</div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">Login no site</a>
                    </h4>
                </div>
                <div id="collapseOne" class="panel-collapse collapse">
                    <div class="panel-body">
                        Apenas utilizadores autenticados podem criar ou licitar em leilões.
                    </div>
                </div>
            </div>

            <div class="faqHeader">Vendedores</div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">Editar Leilões</a>
                    </h4>
                </div>
                <div id="collapseTwo" class="panel-collapse collapse">
                    <div class="panel-body">
                        Um vendedor só pode editar o seu leilão até à primeira licitação. Depois disso só um moderador é que pode editar o leilão a pedido do vendedor.
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseSeven">Cancelar Leilões</a>
                    </h4>
                </div>
                <div id="collapseSeven" class="panel-collapse collapse">
                    <div class="panel-body">
                        Um vendedor não pode cancelar um leilão após o término do mesmo.
                    </div>
                </div>
            </div>

            <div class="faqHeader">Licitadores</div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">Licitação</a>
                    </h4>
                </div>
                <div id="collapseThree" class="panel-collapse collapse">
                    <div class="panel-body">
                        O licitador com a licitação de valor mais elevado num determinado leilão é considerado o vencedor do leilão.
                    </div>
                </div>
            </div>
            
            <div class="faqHeader">Leilões</div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFour">Licitação Fora do Tempo</a>
                    </h4>
                </div>
                <div id="collapseFour" class="panel-collapse collapse">
                    <div class="panel-body">
                        Não são aceites licitações após o leilão terminar.
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFive">Leilão Terminado</a>
                    </h4>
                </div>
                <div id="collapseFive" class="panel-collapse collapse">
                    <div class="panel-body">
                        O leilão termina quando o tempo de duração do leilão é ultrapassado.
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseSix">Licitação final</a>
                    </h4>
                </div>
                <div id="collapseSix" class="panel-collapse collapse">
                    <div class="panel-body">
                        Se nos últimos 30 segundos houver uma licitação superior à anterior, estender o prazo durante mais 1 minuto gerando assim uma nova ronda de licitações.
                        Só quem tenha licitado na ronda anterior pode voltar a licitar.
                    </div>
                </div>
            </div>
            
        </div>
    </div>

    <?php
        include_once 'common/foot.php';
      ?>
        <!-- /.container -->
    </body>
</html>