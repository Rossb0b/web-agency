<?php

namespace App\Controller;

use App\Entity\Book;
use App\Form\BookType;
use App\Entity\Image;
use App\Form\ImageType;
use App\Repository\BookRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\File\Exception\FileException;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Filesystem\Filesystem;
use Symfony\Component\Filesystem\Exception\IOExceptionInterface;

/**
 * @Route("/book")
 */
class BookController extends AbstractController
{
    /**
     * @Route("/", name="book_index", methods={"GET"})
     */
    public function index(BookRepository $bookRepository): Response
    {
        return $this->render('book/index.html.twig', ['books' => $bookRepository->findAll()]);
    }

    /**
     * @Route("/new", name="book_new", methods={"GET","POST"})
     */
    public function new(Request $request): Response
    {
        $book = new Book();
        $image = new Image();
        
        $form = $this->createForm(BookType::class, $book);
        $form->remove('client');
        $form->handleRequest($request);
        
        if ($form->isSubmitted() && $form->isValid()) {
            $file = $request->files->get('book')['image']['src'];

            $name = $file->getClientOriginalName('src');
            $fileName = $this->generateUniqueFileName().'.'.$file->guessExtension();
            
            $alt = $book->getImage()->getText();
            
            $image->setSrc($fileName);
            $image->setText($alt);

            $book->setImage($image);

            try {
                $file->move(
                    $this->getParameter('Cover_directory'),
                    $fileName
                );
            } catch (FileException $e) {
                // ... handle exception if something happens during file upload
            }

            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($image);
            $entityManager->persist($book);
            $entityManager->flush();

            return $this->redirectToRoute('book_index');
        }

        return $this->render('book/new.html.twig', [
            'book' => $book,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="book_show", methods={"GET"})
     */
    public function show(Book $book): Response
    {
        return $this->render('book/show.html.twig', ['book' => $book]);
    }

    /**
     * @Route("/{id}/edit", name="book_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, Book $book, BookRepository $bookRepository): Response
    {
        $form = $this->createForm(BookType::class, $book);

        $image_source = $bookRepository->find($book->getId())->getImage()->getSrc();
        
        $form->handleRequest($request);
       
        if ($form->isSubmitted() && $form->isValid()) {
            $image = new Image();

            if($request->files->get('book')['image']['src'] !== null && $request->files->get('book')['image']['src'] !== 'no_change')
            {
                $file = $request->files->get('book')['image']['src'];
                $name = $file->getClientOriginalName('src');
                $fileName = $this->generateUniqueFileName().'.'.$file->guessExtension();
                $alt = $book->getImage()->getText();
                
                $image->setSrc($fileName);
                $image->setText($alt);

                $book->setImage($image);


                $fileSystem = new Filesystem();

                try {
                    $fileSystem->remove(array('symlink', $this->getParameter('Cover_directory'), $image_source));
                } catch (IOExceptionInterface $exception) {
                    echo "An error occurred while creating your directory at ".$exception->getPath();
                }

                try {
                    $file->move(
                        $this->getParameter('Cover_directory'),
                        $fileName
                    );
                } catch(FileException $e) { 
                    // die($e); 
                }
            }
            else {
                $image = $book->getImage();
                $image->setSrc($image_source);
                $image->setText($book->getImage()->getText());
                $book->setImage($image);
            }
            $this->getDoctrine()->getManager()->persist($image);
            $this->getDoctrine()->getManager()->persist($book);
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('book_index', ['id' => $book->getId()]);
        }

        return $this->render('book/edit.html.twig', [
            'book' => $book,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="book_delete", methods={"DELETE"})
     */
    public function delete(Request $request, Book $book): Response
    {
        if ($this->isCsrfTokenValid('delete'.$book->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($book);
            $entityManager->flush();
        }

        return $this->redirectToRoute('book_index');
    }

        /**
     * @return string
     */
    private function generateUniqueFileName()
    {
        // md5() reduces the similarity of the file names generated by
        // uniqid(), which is based on timestamps
        return md5(uniqid());
    }
}
