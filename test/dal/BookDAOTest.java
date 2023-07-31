/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package dal;

import java.util.List;
import model.Account;
import model.Book;
import model.Item;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Admin
 */
public class BookDAOTest {

    public BookDAOTest() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    @Before
    public void setUp() {
    }

    @After
    public void tearDown() {
    }

    @Test(expected = Exception.class)
    public void testUpdateBookUTCID01() {
        Book b = null;
        int pId = 0;
        BookDAO instance = new BookDAO();
        int result = instance.updateBook(b, pId);
        assertEquals(0, result);
    }

    @Test(expected = Exception.class)
    public void testUpdateBookUTCID02() {
        Book b = null;
        int pId = -1;
        BookDAO instance = new BookDAO();
        int result = instance.updateBook(b, pId);
        assertEquals(0, result);
    }

    @Test
    public void testUpdateBookUTCID03() {
        Book b = new Book(1, "abc", "Kim Đồng", 1, 50000, "img.img");
        int pId = 5;
        BookDAO instance = new BookDAO();
        int result = instance.updateBook(b, pId);
        assertEquals(1, result);
    }

    @Test
    public void testUpdateBookUTCID04() {
        Book b = new Book(1, "abc", "Kim Đồng", 1, 50000, "img.img");
        int pId = 0;
        BookDAO instance = new BookDAO();
        int result = instance.updateBook(b, pId);
        assertEquals(1, result);
    }

    @Test
    public void testUpdateBookUTCID05() {
        Book b = new Book(1, "abc", "Kim Đồng", 1, 50000, "img.img");
        int pId = -1;
        BookDAO instance = new BookDAO();
        int result = instance.updateBook(b, pId);
        assertEquals(0, result);
    }

    @Test
    public void testUpdateBookUTCID06() {
        Book b = new Book(1, "abc", "Kim Đồng", 1, 50000, null);
        int pId = 5;
        BookDAO instance = new BookDAO();
        int result = instance.updateBook(b, pId);
        assertEquals(1, result);
    }

    @Test
    public void testUpdateBookUTCID07() {
        Book b = new Book(1, "abc", "Kim Đồng", 1, 50000, null);
        int pId = 0;
        BookDAO instance = new BookDAO();
        int result = instance.updateBook(b, pId);
        assertEquals(1, result);
    }

    @Test
    public void testUpdateBookUTCID08() {
        Book b = new Book(1, "abc", "Kim Đồng", 1, 50000, null);
        int pId = -1;
        BookDAO instance = new BookDAO();
        int result = instance.updateBook(b, pId);
        assertEquals(0, result);
    }

    @Test
    public void testUpdateBookUTCID09() {
        Book b = new Book(1, "abc", "Kim Đồng", -1, -50000, null);
        int pId = 5;
        BookDAO instance = new BookDAO();
        int result = instance.updateBook(b, pId);
        assertEquals(0, result);
    }

    @Test
    public void testUpdateBookUTCID10() {
        Book b = new Book(1, "abc", "Kim Đồng", -1, -50000, null);
        int pId = -1;
        BookDAO instance = new BookDAO();
        int result = instance.updateBook(b, pId);
        assertEquals(0, result);
    }

    @Test(expected = Exception.class)
    public void testUpdateBoughtBookUTCID01() {
        Item item = new Item(null, 5, 5);
        BookDAO instance = new BookDAO();
        assertEquals(0, instance.updateBoughtBook(item));
    }

    @Test(expected = Exception.class)
    public void testUpdateBoughtBookUTCID02() {
        Item item = new Item(null, 5, 0);
        BookDAO instance = new BookDAO();
        assertEquals(0, instance.updateBoughtBook(item));
    }

    @Test(expected = Exception.class)
    public void testUpdateBoughtBookUTCID03() {
        Item item = new Item(null, 0, 5);
        BookDAO instance = new BookDAO();
        assertEquals(0, instance.updateBoughtBook(item));
    }

    @Test
    public void testUpdateBoughtBookUTCID04() {
        Item item = new Item(new Book(1, "abc", "Kim Đồng", 1, 50000, "img.img"), 0, -1);
        BookDAO instance = new BookDAO();
        assertEquals(0, instance.updateBoughtBook(item));
    }

    @Test
    public void testUpdateBoughtBookUTCID05() {
        Item item = new Item(new Book(1, "abc", "Kim Đồng", 1, 50000, "img.img"), 5, 5);
        BookDAO instance = new BookDAO();
        assertEquals(1, instance.updateBoughtBook(item));
    }

    @Test
    public void testUpdateBoughtBookUTCID06() {
        Item item = new Item(new Book(1, "abc", "Kim Đồng", 1, 50000, "img.img"), 0, 0);
        BookDAO instance = new BookDAO();
        assertEquals(1, instance.updateBoughtBook(item));
    }

    @Test
    public void testUpdateBoughtBookUTCID07() {
        Item item = new Item(new Book(1, "abc", "Kim Đồng", 1, 50000, "img.img"), -1, 5);
        BookDAO instance = new BookDAO();
        assertEquals(0, instance.updateBoughtBook(item));
    }

    @Test
    public void testUpdateBoughtBookUTCID08() {
        Item item = new Item(new Book(1, "abc", "Kim Đồng", 1, 50000, null), 5, -1);
        BookDAO instance = new BookDAO();
        assertEquals(0, instance.updateBoughtBook(item));
    }

    @Test
    public void testUpdateBoughtBookUTCID09() {
        Item item = new Item(new Book(1, "abc", "Kim Đồng", 1, 50000, null), 0, 0);
        BookDAO instance = new BookDAO();
        assertEquals(0, instance.updateBoughtBook(item));
    }

    @Test
    public void testUpdateBoughtBookUTCID10() {
        Item item = new Item(new Book(1, "abc", "Kim Đồng", 1, 50000, null), -1, -1);
        BookDAO instance = new BookDAO();
        assertEquals(0, instance.updateBoughtBook(item));
    }

    @Test
    public void testUpdateBoughtBookUTCID11() {
        Item item = new Item(new Book(1, "abc", "Kim Đồng", -1, -50000, null), 5, 5);
        BookDAO instance = new BookDAO();
        assertEquals(0, instance.updateBoughtBook(item));
    }

    @Test
    public void testUpdateBoughtBookUTCID12() {
        Item item = new Item(new Book(1, "abc", "Kim Đồng", -1, -50000, null), -1, -1);
        BookDAO instance = new BookDAO();
        assertEquals(0, instance.updateBoughtBook(item));
    }
}
