public class Matricula {
    private int Id;
    private String Semestre;
    private String Aluno;
    private String Disciplina;
    private int N1;
    private int N2;
    private double MF;
    private int Faltas;
    private String Situacao;

    public Matricula() {
    }

    public int getId() {
        return Id;
    }

    public String getSemestre() {
        return Semestre;
    }

    public String getAluno() {
        return Aluno;
    }

    public String getDisciplina() {
        return Disciplina;
    }

    public int getN1() {
        return N1;
    }

    public int getN2() {
        return N2;
    }

    public double getMF() {
        return MF;
    }

    public int getFaltas() {
        return Faltas;
    }

    public String getSituacao() {
        return Situacao;
    }

    public void setId(int id) {
        Id = id;
    }

    public void setSemestre(String semestre) {
        Semestre = semestre;
    }

    public void setAluno(String aluno) {
        Aluno = aluno;
    }

    public void setDisciplina(String disciplina) {
        Disciplina = disciplina;
    }

    public void setN1(int n1) {
        N1 = n1;
    }

    public void setN2(int n2) {
        N2 = n2;
    }

    public void setMF(double MF) {
        this.MF = MF;
    }

    public void setFaltas(int faltas) {
        Faltas = faltas;
    }

    public void setSituacao(String situacao) {
        Situacao = situacao;
    }
    @Override
    public String toString() {
        return "Matricula{" +
                "id=" + Id +
                ", semestre='" + Semestre + '\'' +
                ", aluno='" + Aluno + '\'' +
                ", disciplina='" + Disciplina + '\'' +
                ", n1=" + N1 +
                ", n2=" + N2 +
                ", mf=" + MF +
                ", faltas=" + Faltas +
                ", situacao='" + Situacao + '\'' +
                '}';
    }

}
