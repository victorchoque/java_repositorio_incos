/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

/**
 *
 * @author v3ct0r
 */
import java.text.Normalizer;
import java.util.regex.Pattern;

public class SlugGenerator {
    public static String toSlug(String input) {
        if (input == null) {
            return "";
        }

        // Normaliza para eliminar acentos y caracteres especiales
        String normalized = Normalizer.normalize(input, Normalizer.Form.NFD);
        String noAccent = normalized.replaceAll("\\p{InCombiningDiacriticalMarks}+", "");

        // Reemplaza caracteres no alfanuméricos con espacios, y espacios con guiones
        String slug = noAccent.replaceAll("[^a-zA-Z0-9\\s]", "").toLowerCase(); // Eliminar caracteres no alfanuméricos
        slug = slug.trim().replaceAll("\\s+", "-"); // Reemplazar espacios con guiones

        return slug;
    }
}
