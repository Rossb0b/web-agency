<?php

namespace App\Form;

use App\Entity\Image;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\FormInterface;
use App\Repository\BookRepository;


class ImageType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('src', FileType::class, array('data_class' => null, 'empty_data' => '/uploads/Cover/5ae4acdebaada08ac8bb8c02f8de9c9b.jpeg'))
            ->add('text');
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Image::class
        ]);
    }
}
