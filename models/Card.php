<?php
/**
 * Created by PhpStorm.
 * User: MNixA
 * Date: 21.03.2018
 * Time: 17:39
 */

namespace app\models;

use \yii\db\ActiveRecord;

class Card extends ActiveRecord {

    public static function tableName() {
        return 'card';
    }

    public function getUser() {
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }
}