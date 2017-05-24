<?php
namespace Tyondo\Biashara\Database\seeds;
use Illuminate\Database\Seeder;
use Faker\Factory as Faker;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class BiasharaTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
       // $this->dummy();

    }

    private function dummy()
    {
        $faker = Faker::create();
            $title = $faker->sentence;
            $slug = str_slug($title);
            $body = $faker->paragraph(15);
            $summary = str_limit($body,40,'.');

        foreach (range(1,5) as $index) {
            DB::table('posts')->insert([
                'user_id' => 1,
                'category_id' => 1,
                'photo_id' => 2,
                'status' => 2,
                'title' => $title,
                'slug' => $slug.'#'.Carbon::now().uniqid(),
                'body' => $body,
                'summary' => $summary,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ]);
        }
    }
}
