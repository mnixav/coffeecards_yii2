<?php
/**
 * Created by PhpStorm.
 * User: MNixA
 * Date: 26.03.2018
 * Time: 10:13
 */

namespace app\models;

use yii\base\Model;
use Yii;
use yii\helpers\Html;

class Profile extends Model {

    public $name;
    public $username;
    public $email;
    public $new_password;
    public $friendsOnly;
    public $cards;

    /**
     * @return array the validation rules.
     */
    public function rules()
    {
        return [
            ['friendsOnly', 'boolean'],
            ['email', 'email'],
            ['name', 'match', 'pattern' => '/^[а-яА-Яa-zA-ZёЁ0-9_]+$/'],
            ['name', 'string', 'length' => [2, 20]],
            ['new_password', 'match', 'pattern' => '/^[ёа-яa-z0-9_]+$/i'],
            ['new_password', 'string', 'length' => [6, 20]],

        ];
    }

    public function attributeLabels() {
        return [
            'name' => 'Ваше имя',
            'username' => 'Имя пользователя',
            'new_password' => 'Новый пароль',
            'friendsOnly' => 'Скрыть мои публикации',
        ];
    }

    public function getOldSettings() {
        $user = Yii::$app->user->identity;
        $this->name = $user->name;
        $this->username = $user->username;
        $this->email = $user->email;
        $this->friendsOnly = $user->friendsOnly;
    }

    public function saveSettings() {
        if ($this->validate()) {
            $user = User::findIdentity(Yii::$app->user->identity->getId());
            $user->name = $this->name;
            $user->email = $this->email;
            if(!empty($this->new_password)){
                $user->password  = Yii::$app->getSecurity()->generatePasswordHash($this->new_password);
            }
            $user->friendsOnly = $this->friendsOnly;
            return $user->save();
        }
    }

    public function getCards() {
        $user_id = Yii::$app->user->identity->getId();
       $this->cards = Card::find()->where(['user_id' => $user_id])->orderBy('date DESC')->all();
    }
}