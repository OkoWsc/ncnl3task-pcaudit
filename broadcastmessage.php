<?php
/**
 * PC Audit
 * (C) Gregory Oakley-Stevenson
 * @package pcaudit
 */

require_once('config.php');

include('getfloorrooms.php');
$smarty->display('broadcastmessage.tpl');
