<?php
/**
 * Created by PhpStorm.
 * User: MNixA
 * Date: 27.03.2018
 * Time: 17:26
 */

namespace app\models;


use yii\base\Model;
use Yii;

class AddCard extends Model {

    public $photo;
    public $description;


    public function rules()
    {
        return [
            ['photo', 'required'],
            ['photo', 'image', 'extensions' => 'png, jpg',
                'minWidth' => 400, /*'maxWidth' => 1000,*/
                'minHeight' => 400, /*'maxHeight' => 1000,*/
            ],
            ['description', 'string', 'length' => [0, 1024]],
        ];
    }

    public function attributeLabels() {
        return [
            'photo' => "Выберите фото для публикации",
            'description' => 'Описание',
        ];
    }

    public function add() {
        if ($this->validate()) {
            $fileName = uniqid('card', 1) . '.' . $this->photo->extension;
            $folder = \Yii::getAlias('@web') .'cards/';
            if($this->photo->saveAs($folder . $fileName)){
                CropImage::cropToFixedWidth($folder. $fileName, $folder . $fileName, 1000 );
                CropImage::cropStrictly($folder. $fileName, $folder . 'thumbnail/' . $fileName, 400, 400 );
                $card = new Card;
                $card->date = time();
                $card->user_id = Yii::$app->user->getId();
                $card->img = $fileName;
                if(!empty($this->description)){
                    $card->description = base64_encode($this->description);
                }
                return $card->save();
            }
        }
        return false;
    }
}