public class main {
    public static void main(String[] args) {
        contexto contex = new contexto();
        contex.Restaurar();

        Menu menu = new Menu(contex);

        menu.MenuPrincipal();
    }
}
