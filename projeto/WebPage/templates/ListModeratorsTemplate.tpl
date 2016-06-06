{include file='common/head.tpl'} {include file='common/bar.tpl'}

<div id="moderatorStatus"></div>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <table class="table">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Email</th>
                    </tr>
                </thead>
                <tbody>
                    {foreach $mods as $mod} {$infor = getInfoByID($mod.id_utilizador)}
                    <tr class="info">
                        <td>{$infor[0].nome|escape}</td>
                        <td><a href="">{$infor[0].e_mail|escape}</a></td>
                    </tr>
                    {/foreach}
                </tbody>
            </table>
        </div>
    </div>
</div>
<script src="../js/jquery_scripts.js"></script>
{include file='common/foot.tpl'}
</body>

</html>