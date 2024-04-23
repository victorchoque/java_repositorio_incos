/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.Arrays;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import java.util.Base64;
/**
 *
 * @author v3ct0r
 */
public class AESUtil {
    
    private static final String DEFAULT_CLAVE = "clave_secreta_de_aplicacion"; // Clave secreta para cifrado
    
    public static String cifrar(String texto, String password) throws Exception {
        byte[] clave = generarClave(password);
        SecretKeySpec key = new SecretKeySpec(clave, "AES");
        Cipher cifrador = Cipher.getInstance("AES");
        cifrador.init(Cipher.ENCRYPT_MODE, key);
        byte[] textoCifrado = cifrador.doFinal(texto.getBytes());
        return Base64.getEncoder().encodeToString(textoCifrado);
    }
    
    public static String descifrar(String textoCifrado, String password) throws Exception {
        byte[] clave = generarClave(password);
        SecretKeySpec key = new SecretKeySpec(clave, "AES");
        Cipher cifrador = Cipher.getInstance("AES");
        cifrador.init(Cipher.DECRYPT_MODE, key);
        byte[] textoDescifrado = cifrador.doFinal(Base64.getDecoder().decode(textoCifrado));
        return new String(textoDescifrado);
    }

    private static byte[] generarClave(String password) throws Exception {
        MessageDigest sha = MessageDigest.getInstance("SHA-256");
        byte[] claveOriginal = password.getBytes(StandardCharsets.UTF_8);
        byte[] claveHash = sha.digest(claveOriginal);
        // Truncar o extender a la longitud requerida por AES
        return Arrays.copyOf(claveHash, 16); // 16 bytes para AES-128
    }

    public static String cifrar(String texto) throws Exception {
        return cifrar(texto, DEFAULT_CLAVE);
    }

    public static String descifrar(String textoCifrado) throws Exception {
        return descifrar(textoCifrado, DEFAULT_CLAVE);
    }
}
