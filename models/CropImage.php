<?php
/**
 * Created by PhpStorm.
 * User: MNixA
 * Date: 25.03.2018
 * Time: 0:05
 */

namespace app\models;

use yii\base\Model;

class CropImage extends Model {

    /**
     * @param string $oldImage - строка, представляющая путь к обрезаемому изображению
     * @param string $newImage - строка, представляющая путь куда нахо сохранить выходное обрезанное изображение
     * @param int $width - ширина выходного обрезанного изображения
     * @param int $height - высота выходного обрезанного изображения
     */

    public static function cropStrictly($oldImage, $newImage, $width, $height){
        self::crop($oldImage, $newImage, $width, $height);
    }

    public static function cropToFixedWidth($oldImage, $newImage, $width){

        list($realWidth, $realHeight, $lImageExtensionId) = getimagesize($oldImage);
        if($realWidth < $width){
            $width = $realWidth;
        }
        $ratio = $realHeight / $realWidth;
        $height = floor($ratio * $width);

        self::crop($oldImage, $newImage, $width, $height);
    }

    public static function crop($oldImage, $newImage, $width, $height) {
        if (($width < 0) || ($height < 0)) {
            return false;
        }

        // Массив с поддерживаемыми типами изображений
        $lAllowedExtensions = array(1 => "gif", 2 => "jpeg", 3 => "png");

        // Получаем размеры и тип изображения в виде числа
        list($lInitialImageWidth, $lInitialImageHeight, $lImageExtensionId) = getimagesize($oldImage);

        if (!array_key_exists($lImageExtensionId, $lAllowedExtensions)) {
            return false;
        }
        $lImageExtension = $lAllowedExtensions[$lImageExtensionId];

        // Получаем название функции, соответствующую типу, для создания изображения
        $func = 'imagecreatefrom' . $lImageExtension;
        // Создаём дескриптор исходного изображения
        $lInitialImageDescriptor = $func($oldImage);

        // Определяем отображаемую область
        $lCroppedImageWidth = 0;
        $lCroppedImageHeight = 0;
        $lInitialImageCroppingX = 0;
        $lInitialImageCroppingY = 0;
        if ($width / $height > $lInitialImageWidth / $lInitialImageHeight) {
            $lCroppedImageWidth = floor($lInitialImageWidth);
            $lCroppedImageHeight = floor($lInitialImageWidth * $height / $width);
            $lInitialImageCroppingY = floor(($lInitialImageHeight - $lCroppedImageHeight) / 2);
        } else {
            $lCroppedImageWidth = floor($lInitialImageHeight * $width / $height);
            $lCroppedImageHeight = floor($lInitialImageHeight);
            $lInitialImageCroppingX = floor(($lInitialImageWidth - $lCroppedImageWidth) / 2);
        }

        // Создаём дескриптор для выходного изображения
        $lNewImageDescriptor = imagecreatetruecolor($width, $height);
        imagecopyresampled($lNewImageDescriptor, $lInitialImageDescriptor, 0, 0, $lInitialImageCroppingX, $lInitialImageCroppingY, $width, $height, $lCroppedImageWidth, $lCroppedImageHeight);
        $func = 'image' . $lImageExtension;

        // сохраняем полученное изображение в указанный файл
        return $func($lNewImageDescriptor, $newImage);
    }




}