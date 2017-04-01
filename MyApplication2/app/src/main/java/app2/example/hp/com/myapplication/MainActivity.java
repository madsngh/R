package app2.example.hp.com.myapplication;

import android.os.Bundle;
import android.support.v4.view.ViewPager;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;

import java.util.ArrayList;
import java.util.List;

import io.karim.MaterialTabs;

public class MainActivity extends AppCompatActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
       ViewPager pager = (ViewPager) findViewById(R.id.view_pager);
        List<android.support.v4.app.Fragment> list = new ArrayList<android.support.v4.app.Fragment>();
        list.add(new Fragment_boxoffice());
        list.add(new MyFragment2());
        list.add(new MyFragment2());
        pager.setAdapter(new SamplePagerAdapter(getSupportFragmentManager(), 3, list));
// Bind the tabs to the ViewPager
        MaterialTabs tabs = (MaterialTabs) findViewById(R.id.material_tabs);
        tabs.setViewPager(pager);

        /*DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        //ActionBarDrawerToggle toggle = new ActionBarDrawerToggle(
               // this, drawer, toolbar, R.string.navigation_drawer_open, R.string.navigation_drawer_close);
       // drawer.setDrawerListener(toggle);
        //toggle.syncState();

        NavigationView navigationView = (NavigationView) findViewById(R.id.nav_view);
        navigationView.setNavigationItemSelectedListener(this);
    }

    @Override
    public void onBackPressed() {
        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        if (drawer.isDrawerOpen(GravityCompat.START)) {
            drawer.closeDrawer(GravityCompat.START);
        } else {
            super.onBackPressed();
        }
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;

    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }

    @SuppressWarnings("StatementWithEmptyBody")
    @Override
    public boolean onNavigationItemSelected(MenuItem item) {
        // Handle navigation view item clicks here.
        int id = item.getItemId();

        if (id == R.id.nav_camera) {
            // Handle the camera action
        } else if (id == R.id.nav_gallery) {

        } else if (id == R.id.nav_slideshow) {

        } else if (id == R.id.nav_manage) {

        } else if (id == R.id.nav_share) {

        } else if (id == R.id.nav_send) {

        }

        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        drawer.closeDrawer(GravityCompat.START);
        return true;
    }*/
    }

    public class SamplePagerAdapter extends android.support.v4.app.FragmentStatePagerAdapter {
        private final String[] TITLES = {"ITEM ONE", "ITEM TWO", "ITEM THREE", "ITEM FOUR", "ITEM FIVE", "ITEM SIX", "ITEM SEVEN", "ITEM EIGHT",
                "ITEM NINE", "ITEM TEN", "ITEM ELEVEN"};

        private ArrayList<String> mTitles;
        List<android.support.v4.app.Fragment> fragmentList;

        public SamplePagerAdapter(android.support.v4.app.FragmentManager fm, int numberOfTabs, List<android.support.v4.app.Fragment> fragmentList) {
            super(fm);
            this.fragmentList = fragmentList;
            mTitles = new ArrayList<>();
            for (int i = 0; i < numberOfTabs; i++) {
                mTitles.add(TITLES[i]);
            }
        }

        @Override
        public CharSequence getPageTitle(int position) {
            return mTitles.get(position);
        }

        @Override
        public int getCount() {

            return mTitles.size();
        }

        @Override
        public android.support.v4.app.Fragment getItem(int position) {
            return fragmentList.get(position);
        }
    }
}




