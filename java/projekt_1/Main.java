import java.io.File;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {


        try {
            Scanner scanner = new Scanner(System.in);

            do {

                File file = new File("plik.txt");
                FileWriter zapisz = new FileWriter(file, true);

                Scanner scannerOZP = new Scanner(file);


                ArrayList<Uczen> lista = new ArrayList<>();

                if (!file.exists()) {
                    file.createNewFile();
                }


                System.out.println("Dziennik:");
                lista.clear();

                while (scannerOZP.hasNext()) {

                    String linia = scannerOZP.nextLine();

                    String[] z = linia.split(" ");

                    String imie1, nazwisko1, wiek1;

                    imie1 = z[0];
                    nazwisko1 = z[1];
                    wiek1 = z[2];


                    Uczen uczen1 = new Uczen(imie1, nazwisko1, wiek1);

                    lista.add(uczen1);


                }
                scannerOZP.close();

                int i = 0;

                for (Uczen item : lista) {
                    System.out.println(item.imie + " " + item.nazwisko + " " + item.wiek);
                    i++;
                }
                System.out.println("____________________");
                System.out.println(" Witaj w dzieniku ");
                System.out.println("   Opcje   ");
                System.out.println(" 1-Dodanie nowego ucznia");
                System.out.println(" 2-Usuneicie ucznia");
                System.out.println("____________________");


                System.out.println("Prowadz liczbe co chcesz zrobić");

                String odp = scanner.nextLine();

                if (odp.equals("1")) {

                    System.out.println("Podaj imie ucznia");
                    String imie2 = scanner.nextLine();
                    System.out.println("Podaj nazwisko ucznia");
                    String nazwisko2 = scanner.nextLine();
                    System.out.println("Podaj wiek ucznia");
                    String wiek2 = scanner.nextLine();
                    Uczen uczen2 = new Uczen(imie2, nazwisko2, wiek2);
                    lista.add(uczen2);
                    zapisz.write("\n" + imie2 + " " + nazwisko2 + " " + wiek2);


                } else if (odp.equals("2")) {
                    System.out.println("Podaj numer ucznia którego chcesz usunąć");
                    odp = scanner.nextLine();
                    lista.remove(Integer.parseInt(odp) - 1);
                    System.out.println("Uczeń został usuniety");
                    FileWriter NADzapisz = new FileWriter(file);
                    NADzapisz.write("");
                    NADzapisz.close();
                    for (Uczen item : lista) {
                        zapisz.write(item.imie + " " + item.nazwisko + " " + item.wiek + "\n");
                    }


                }


                zapisz.close();
            } while (true);


        } catch (Exception e) {
        }
    }
}

