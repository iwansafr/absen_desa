<form action="" method="get">
    <div class="panel panel-default">
        <div class="panel-heading">
            Pilih Hari
        </div>
        <div class="panel-body">
            <div class="form-group">
                <label for="hari">hari</label>
                <select name="day" class="form-control" id="">
                    <option value>-Pilih Hari-</option>
                    <?php
                    foreach ($days as $key => $value) {
                        ?>
                        <option value="<?php echo $key;?>"><?php echo $value;?></option>
                        <?php
                    }
                    ?>
                </select>
            </div>
        </div>
        <div class="panel-footer">
            <button type="submit">Setting</button>
        </div>
    </div>
</form>
<?php
// echo date('N');
if (!empty($_GET['day'])) {
    $config = new Zea();
    $config->init('param');
    $config->setHeading('Setting Jam Hari '.$days[$_GET['day']]);
    $config->setParamName('jam_kerja_'.$_GET['day']);
    $config->setTable('config');
    $config->addInput('jam_berangkat_awal','text');
    $config->setType('jam_berangkat_awal','time');
    
    $config->addInput('jam_berangkat_akhir', 'text');
    $config->setType('jam_berangkat_akhir', 'time');
    
    $config->addInput('jam_pulang_awal', 'text');
    $config->setType('jam_pulang_awal', 'time');
    
    $config->addInput('jam_pulang_akhir', 'text');
    $config->setType('jam_pulang_akhir', 'time');
    
    $config->setEnableDeleteParam(false);
    $config->form();
}