<?php
/**
 * Created by PhpStorm.
 * User: MNixA
 * Date: 21.03.2018
 * Time: 22:10
 */

namespace app\models;

use yii\base\Model;
use Yii;

class HomePage extends Model {

    public $cards;

    public function getAllCards(){
        $user_id = Yii::$app->user->getId();
        $user = User::findOne($user_id);
        if($user->friendsOnly == 1){
            $sql = 'SELECT * FROM card WHERE user_id!=:id ORDER BY date DESC LIMIT 50';
            $this->cards = Card::findBySql($sql, [':id' => $user_id])->all();
            /*$this->cards = Card::find()->where('id' != $user_id)->with('user')->limit(50)->orderBy('date DESC')->all();*/
        } else {
            $this->cards = Card::find()->with('user')->limit(50)->orderBy('date DESC')->all();
        }
    }

}