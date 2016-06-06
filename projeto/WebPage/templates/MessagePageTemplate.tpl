 {include file='common/head.tpl'} {include file='common/bar.tpl'}

<!-- Main -->
<div class="container">
    <div class="row">
        <div class="col-md-3">
            <hr>
            <div class="nav nav-stacked">
                <ul class="nav nav-stacked collapse in" id="userMenu">
                    <li>
                        <strong><i class="glyphicon glyphicon-list"></i> Options</strong>
                    </li>
                    <!-- <li class="active"> <a href="#"><i class="glyphicon glyphicon-home"></i> Home</a></li> -->
                    <li><a href="MessagePage.php"><i class="glyphicon glyphicon-envelope"></i> Messages</a></li>
                    <li><a href="ListModerators.php"><i class="glyphicon glyphicon-user"></i> Staff List</a></li>
                    <li><a href="FAQ.php"><i class="glyphicon glyphicon-exclamation-sign"></i> Rules</a></li>
                </ul>
            </div>
        </div>
        <!-- /col-3 -->
        <div class="col-sm-9">
            <div class="bd-example bd-example-tabs" role="tabpanel">
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" id="inbox-tab" data-toggle="tab" href="#inbox" role="tab" aria-controls="inbox" aria-expanded="true">Inbox</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="sent-tab" data-toggle="tab" href="#sent" role="tab" aria-controls="sent" aria-expanded="false">Sent Messages</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="compose-tab" data-toggle="tab" href="#compose" role="tab" aria-controls="compose" aria-expanded="false">Compose Message</a>
                    </li>
                </ul>
                <div class="tab-content" id="myTabContent">
                    <div role="tabpanel" class="tab-pane fade active in" id="inbox" aria-labelledby="inbox-tab" aria-expanded="true">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Title</th>
                                    <th>Email</th>
                                    <th>Time</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach $recetor as $rec}
                                <tr class="info">
                                    <td><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapse{$rec.id_mensagem}">{$rec.titulo}</a>
                                        <div id="collapse{$rec.id_mensagem}" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                {$rec.conteudo|escape}
                                            </div>
                                        </div>
                                    </td>

                                    <td>{$mail = getInfoByID($rec.id_emissor)} {$mail[0].e_mail|escape}</td>
                                    <td>{$rec.data_mensagem|escape}</td>
                                </tr>
                                {/foreach}
                            </tbody>
                        </table>
                    </div>

                    <div class="tab-pane fade" id="sent" role="tabpanel" aria-labelledby="sent-tab" aria-expanded="false">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Title</th>
                                    <th>Email</th>
                                    <th>Time</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach $emissor as $emi}
                                <tr class="info">
                                    <td><a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapse{$emi.id_mensagem}">{$emi.titulo}</a>
                                        <div id="collapse{$emi.id_mensagem}" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                {$emi.conteudo|escape}
                                            </div>
                                        </div>
                                    </td>
                                    </td>
                                    <td>{$mail = getInfoByID($emi.id_recetor)} {$mail[0].e_mail|escape}</td>
                                    <td>{$emi.data_mensagem|escape}</td>
                                </tr>
                                {/foreach}
                            </tbody>
                        </table>
                    </div>
                    <!-- MODAL PARA VER A MSG
                        <div class="modal fade" id="viewMessage" role="dialog">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title"></h4>
                                    </div>
                                    <div class="modal-body">
                                    </div>
                                </div>
                            </div>
                        </div>
                        -->
                    <div class="tab-pane fade" id="compose" role="tabpanel" aria-labelledby="compose-tab" aria-expanded="false">
                        <div class="form-group">
                            <label class="sr-only" for="emailInput">Email</label>
                            <div class="input-group">
                                <div class="input-group-addon">Email</div>
                                <input type="text" class="form-control" id="emailInput" placeholder="example@example.com" value="{$e_mail_to_send|trim}">
                                <div class="input-group-addon">Title</div>
                                <input type="text" class="form-control" id="emailTitle" placeholder="Example">
                            </div>
                            <textarea class="form-control" onresize="false" rows="10" id="messageText"></textarea>
                        </div>
                        <button type="button" class="btn btn-primary" onclick="return sendMessage({$infos.e_mail})">Send</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--/col-span-9-->
</div>
<script src="../js/message.js"></script>
{include file='common/foot.tpl'}
</body>


</html>