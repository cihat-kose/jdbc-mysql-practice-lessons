package jdbc;

import org.testng.annotations.Test;

import java.sql.ResultSet;
import java.sql.SQLException;

public class JDBCPractices02 extends JDBCParent {

    @Test
    public void navigateRowsAndRetrieveColumns() throws SQLException {
        // TASK: "actor" tablosunda satırlar arasında gezinmeyi ve sütun verilerini almayı test eder.

        // "actor" tablosundaki tüm verileri seçiyoruz
        ResultSet resultTable = statement.executeQuery("select * from actor");

        // İlk satıra ilerliyoruz ve ikinci sütundaki veriyi yazdırıyoruz
        resultTable.next(); // Bir adım ileri --> 1. Satır
        System.out.println("resultTable.getString(2) = " + resultTable.getString(2)); // 1. Satır ve 2. Sütun

        // İkinci satıra ilerliyoruz ve "first_name" sütunundaki veriyi yazdırıyoruz
        resultTable.next(); // Bir adım ileri --> 2. Satır
        System.out.println("resultTable.getString(\"first_name\") = " + resultTable.getString("first_name"));// 2. Satır ve "first_name" sütunu

        // Bir önceki satıra geri dönüyoruz ve ikinci sütundaki veriyi tekrar yazdırıyoruz
        resultTable.previous(); // Bir adım geri --> 1. Satır
        System.out.println("resultTable.getString(2) = " + resultTable.getString(2));
    }

    @Test
    public void moveToSpecificRowsAndRelativeMovements() throws SQLException {
        // TASK: "actor" tablosunda belirli satırlara doğrudan gitmeyi ve göreceli hareketleri test eder.

        // "actor" tablosundaki tüm verileri seçiyoruz
        ResultSet resultTable = statement.executeQuery("select * from actor");

        // Doğrudan 10. satıra gidiyoruz ve ikinci sütundaki veriyi yazdırıyoruz
        resultTable.absolute(10); // Doğrudan 10. Satıra git
        System.out.println("resultTable.getString(2) = " + resultTable.getString(2));

        // Doğrudan 5. satıra gidiyoruz ve "first_name" sütunundaki veriyi yazdırıyoruz
        resultTable.absolute(5); // Doğrudan 5. Satıra git
        System.out.println("resultTable.getString(\"first_name\") = " + resultTable.getString("first_name"));

        // Bulunduğumuz yerden 5 satır ileri gidiyoruz ve "first_name" sütunundaki veriyi yazdırıyoruz
        resultTable.relative(5); // Şu anki konumdan 5 satır ileri --> 10. Satıra git
        System.out.println("resultTable.getString(\"first_name\") = " + resultTable.getString("first_name"));

        // Sonraki ve önceki satırlara gidiyoruz
        resultTable.next(); // 11. Satıra gider
        resultTable.previous(); // 10. Satıra geri döner

        // Açıklamalar:
        // resultTable.next()          : Sonraki Satır
        // resultTable.previous        : Önceki Satır
        // resultTable.absolute(10)    : Baştan itibaren 10. satıra gider.
        // resultTable.relative(10)    : Şu anki konumdan itibaren 10 satır ileri gider.
        // resultTable.absolute(-10)   : - (eksi) sondan itibaren 10. satıra gider.
        // resultTable.relative(-5)    : - (eksi) şu anki konumdan 5 satır geri gider.

        // Eğer ilk satırdan itibaren relative ile 5 geri gitmek istersek,
        // sınırı aştığı için hata alırız.
    }

    @Test
    public void navigateToFirstAndLastRows() throws SQLException {
        // TASK: "actor" tablosunda ilk ve son satıra gitmeyi ve satır numaralarını almayı test eder.

        // "actor" tablosundaki tüm verileri seçiyoruz
        ResultSet resultTable = statement.executeQuery("select * from actor");

        // İlk satıra gidiyoruz ve satır numarasını ve ikinci sütundaki veriyi yazdırıyoruz
        resultTable.first(); // İlk satıra gider
        System.out.println("resultTable.getRow() = " + resultTable.getRow());
        System.out.println("resultTable.getString(2) = " + resultTable.getString(2));

        // Son satıra gidiyoruz ve ikinci sütundaki veriyi ve satır numarasını yazdırıyoruz
        resultTable.last(); // Son satıra gider
        System.out.println("resultTable.getString(2) = " + resultTable.getString(2));
        System.out.println("resultTable.getRow() = " + resultTable.getRow());
    }
}
