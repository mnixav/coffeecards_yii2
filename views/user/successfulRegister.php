<?php
/**
 * Created by PhpStorm.
 * User: MNixA
 * Date: 21.03.2018
 * Time: 17:44
 */

$this->title = 'Coffee Cards';
?>
<div class="site-index">

    <div class="body-content">

        <div class="row">
            <div class="jumbotron">
                <h2>
                    Поздравляем с успешной регистрацией.
                </h2>
                <p>
                    Теперь вы можете <?= \yii\helpers\Html::a('перейти', '/user/profile'); ?>
                    в свой профиль.
                </p>
            </div>
        </div>
    </div>
</div>