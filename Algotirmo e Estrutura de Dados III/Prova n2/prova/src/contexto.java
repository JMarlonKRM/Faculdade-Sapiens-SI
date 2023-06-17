import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

public class contexto {

    public List<Matricula> Matriculas;

    public List<Matricula> getMatriculas() {
        return Matriculas;
    }

    public void setMatriculas(List<Matricula> matriculas) {
        this.Matriculas = matriculas;
    }
    public contexto(){
        Matriculas = new ArrayList<>();
    }

    public void Restaurar(){
        try {
            String json = new String(Files.readAllBytes(Paths.get("src/sapiens.json")), StandardCharsets.UTF_8);
            if (!json.isEmpty()){
                List<Matricula> matriculas = new Gson().fromJson(json, new TypeToken<List<Matricula>>(){}.getType());
                if(matriculas != null){
                    Matriculas = matriculas;
                }
            }
        }catch (IOException e ){
            e.printStackTrace();
        }
    }
}