package app2.example.hp.com.myapplication;

import android.content.Context;
import android.util.Log;
import android.widget.Toast;

/**
 * Created by SIDDHARTH on 1/10/2016.
 */
public class L {
    public static void m(String message) {
        Log.d("Siddharth", "" + message);
    }

    public static void t(Context context, String message) {
        Toast.makeText(context, message + "", Toast.LENGTH_SHORT).show();
    }

    public static void T(Context context, String message) {
        Toast.makeText(context, message + "", Toast.LENGTH_SHORT).show();
    }
}
