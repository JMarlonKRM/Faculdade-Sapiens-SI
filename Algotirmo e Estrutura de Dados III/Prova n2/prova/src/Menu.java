
import java.text.DecimalFormat;
import java.util.*;

//Q1 (1 ponto): Todos os alunos matriculados na disciplina AED3 no semestre 2023.1
//Q2 (1 ponto): A % de aprovação dos alunos da disciplina AED3 no semestre 2023.1
//Q3 (1 ponto): A média das notas dos alunos da disciplina AED3 no semestre 2023.1
//Q4 (1 ponto): Todas as matérias cursadas pelo aluno 111.111.111-11, juntamente com a média final, total de faltas e situação.
//Q5 (1 ponto): Qual a média geral do aluno 111.111.111-11 (a média de todas as notas que ele tirou nas disciplinas).
//Q6 (1 ponto): Qual o ranking do aluno 111.111.111-11 no semestre 2023.1 (dado a média de todos os alunos, qual a posição dele?)
//Q7 (1 ponto): Qual a disciplina que mais reprova no semestre 2023.1?
public class Menu {
    Scanner input = new Scanner(System.in);

    private contexto _j;

    public Menu(contexto jo){_j = jo;}


    public void MenuPrincipal(){
        System.out.println();
        System.out.println("----------------------------------------------");
        System.out.println("--------------------PROVA---------------------");
        System.out.println("----------------------------------------------");
        System.out.println("Q1 (1 ponto): Todos os alunos matriculados na disciplina AED3 no semestre 2023.1 ");
        System.out.println("Q2 (1 ponto): A % de aprovação dos alunos da disciplina AED3 no semestre 2023.1");
        System.out.println("Q3 (1 ponto): A média das notas dos alunos da disciplina AED3 no semestre 2023.1");
        System.out.println("Q4 (1 ponto): Todas as matérias cursadas pelo aluno 111.111.111-11, juntamente com a média final, total de faltas e situação.");
        System.out.println("Q5 (1 ponto): Qual a média geral do aluno 111.111.111-11 (a média de todas as notas que ele tirou nas disciplinas).");
        System.out.println("Q6 (1 ponto): Qual o ranking do aluno 111.111.111-11 no semestre 2023.1 (dado a média de todos os alunos, qual a posição dele?)");
        System.out.println("Q7 (1 ponto): Qual a disciplina que mais reprova no semestre 2023.1?");
        System.out.println();
        System.out.println("DIGITE A RESPOSTA DA QUESTÃO NA QUAL DESEJA A RESPOSTA: Q");
        int op = input.nextInt();
        if (op == 1){
            q1();
        }
        if (op == 2){
            q2();
        }
        if (op == 3){
            q3();
        }
        if (op == 4){
            q4();
        }
        if (op == 5){
            q5();
        }
        if (op == 6){
            q6();
        }
        if (op == 7){
            q7();
        }
    }
    public void q1(){
        System.out.println("-------------------------");
        System.out.println("-----------Q1------------");
        System.out.println("-------------------------");
        System.out.println();
        System.out.println();

        for (Matricula matriculas : _j.Matriculas){
            if (matriculas.getDisciplina().equals("AED3") && matriculas.getSemestre().equals("2023.1")){
                System.out.println(matriculas);
            }
        }
        System.out.println(
        );
        System.out.println();
        System.out.println();
        MenuPrincipal();

    }
    public void q2(){
        System.out.println("-------------------------");
        System.out.println("-----------Q2------------");
        System.out.println("-------------------------");
        System.out.println();
        System.out.println();
        int aprovados = 0;
        int total = _j.getMatriculas().size();
        for (Matricula matriculas : _j.Matriculas){
            if (matriculas.getDisciplina().equals("AED3") && matriculas.getSemestre().equals("2023.1") && matriculas.getSituacao().equals("Aprovado")){
                aprovados ++;
            }
        }

        double PercAprovados = (double) aprovados / total * 100;

        DecimalFormat DF = new DecimalFormat("#.###");
        String percAprovadosNovo = DF.format(PercAprovados);

        System.out.println("Porcentual de aprovados : "+percAprovadosNovo+"%");


        System.out.println();
        System.out.println();
        System.out.println();
        System.out.println();
        MenuPrincipal();
    }

    public void q3(){
        System.out.println("-------------------------");
        System.out.println("-----------Q3------------");
        System.out.println("-------------------------");
        System.out.println();
        System.out.println();

        int notas = 0;
        int contador = 0;
        for (Matricula matriculas : _j.Matriculas){
            if(matriculas.getDisciplina().equals("AED3") && matriculas.getSemestre().equals("2023.1")){
                contador ++;
                notas = matriculas.getN1() + matriculas.getN2();
            }
        }
        double media = notas / contador;

        System.out.println("A media desses alunos é: "+ media);
        System.out.println();
        System.out.println();
        System.out.println();
        System.out.println();
        MenuPrincipal();
    }

    public void q4(){
        System.out.println("-------------------------");
        System.out.println("-----------Q4------------");
        System.out.println("-------------------------");
        System.out.println();
        System.out.println();

        for(Matricula matriculas : _j.Matriculas){
            if(matriculas.getAluno().equals("111.111.111-11")){
                System.out.println( "Diciplina: "+ matriculas.getDisciplina() + "  Média final: "+ matriculas.getMF() + "  Faltas: "+matriculas.getFaltas()+"  Situação:  "+matriculas.getSituacao());
            }
        }
        System.out.println();
        System.out.println();
        System.out.println();
        System.out.println();
        MenuPrincipal();
    }
    public void q5(){
        System.out.println("-------------------------");
        System.out.println("-----------Q5------------");
        System.out.println("-------------------------");
        System.out.println();
        System.out.println();

        int notas = 0;
        int contador = 0;

        for(Matricula matriculas : _j.Matriculas){
            if(matriculas.getAluno().equals("111.111.111-11")){
                contador ++;
                notas = matriculas.getN1() + matriculas.getN2();
            }
        }
        double media = notas / contador;
        System.out.println("a media desse aluno é: "+ media);
        System.out.println();
        System.out.println("obs: eu nao entendi muito bem essa questão entao somei todas as notas n1,n2 dele e dps fiz a divisão pela quantidade");
        System.out.println();
        System.out.println();
        System.out.println();
        System.out.println();
        MenuPrincipal();
    }
    public void q6(){
        System.out.println("-------------------------");
        System.out.println("-----------Q6------------");
        System.out.println("-------------------------");
        System.out.println();
        System.out.println();

        double MediaAluno = 0;
        for(Matricula matriculas : _j.Matriculas){
            if(matriculas.getAluno().equals("111.111.111-11") && matriculas.getSemestre().equals("2023.1")){
                MediaAluno = (matriculas.getN1() + matriculas.getN2()) / 2;
                break;
            }
        }
        List<Double> MediasGerais = new ArrayList<>();
        for (Matricula matriculas : _j.Matriculas){
            if (matriculas.getSemestre().equals("2023.1")){
                double media = (matriculas.getN1() + matriculas.getN2()) /2;
                MediasGerais.add(media);
            }
        }

        Collections.sort(MediasGerais, Collections.reverseOrder());
        int positAluno = MediasGerais.indexOf(MediaAluno);

        int Rank = positAluno + 1; // pq sempre inicia no zero

        System.out.println("RANK ALUNO: 111.111.111-11 no Semestre 2023.1: " + Rank);


        System.out.println();
        System.out.println();
        System.out.println();
        System.out.println();
        MenuPrincipal();
    }

    public void q7(){
        System.out.println("-------------------------");
        System.out.println("-----------Q7------------");
        System.out.println("-------------------------");
        System.out.println();
        System.out.println();

        Map<String, Integer> reprovacoes = new HashMap<>();
        for(Matricula matriculas : _j.Matriculas){
            if(matriculas.getSituacao().equals("Reprovado por Nota") || matriculas.getSituacao().equals("Reprovado por Falta")){
                String disciplina = matriculas.getDisciplina();
                if(reprovacoes.containsKey(disciplina)){
                    int contagem = reprovacoes.get(disciplina);
                    reprovacoes.put(disciplina, contagem +1);
                }else{ reprovacoes.put(disciplina, 1);                }
            }
        }

        String MaisReprovadas = "";
        int Maxreprovacao = 0;

        for(Map.Entry<String, Integer> entry : reprovacoes.entrySet()){
            String disciplina2 = entry.getKey();
            int qtaReprovacao = entry.getValue();

            if(qtaReprovacao > Maxreprovacao){
                Maxreprovacao = qtaReprovacao;
                MaisReprovadas = disciplina2;
            }
        }
        System.out.println("A mais reprovada em 2023.1 foi: " + MaisReprovadas);

        System.out.println();
        System.out.println();
        System.out.println();
        System.out.println();
        MenuPrincipal();
    }
}
