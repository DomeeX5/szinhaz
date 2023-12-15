import { Body, Controller, Get, Param, Post, Redirect, Render, Res } from '@nestjs/common';
import * as mysql from 'mysql2';
import { AppService } from './app.service';
import { newCoupon } from './Coupon';
import { Response } from 'express';

const conn = mysql.createPool({
  host: process.env.DB_HOST || 'localhost',
  port: parseInt(process.env.DB_PORT) || 3306,
  user: process.env.DB_USERNAME || 'root',
  password: process.env.DB_PASSWORD || '',
  database: process.env.DB_DATABASE || 'database',
}).promise();

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get('/')
  @Render('index')
  async index() {
    const [ adatok ] = await conn.execute(
      'SELECT id, title, percentage, code FROM kedvezmeny ORDER BY title'
    );
    return { kedvezmenyek: adatok };
  }

  @Get('/newCoupon')
  @Render('newCoupon')
  ujZeneForm() {
    return { errors: [] }
  }

  @Post('/newCoupon')
  @Render('newCoupon')
  async ujZene(@Body() newCoupon: newCoupon, @Res() res: Response){
      const errors: string[] = [];
      const couponRegex = /[a-zA-Z]{4}-[0-9]{6}/;
      if(newCoupon.title == ''){
        errors.push('A darab megadása kötelező')
      }
      if(newCoupon.percentage.toString() == ''){
        errors.push('Kedvezmény % megadása kötelező')
      }
      if(newCoupon.percentage > 100 || newCoupon.percentage < 1) {
          errors.push('A kedvezmény csak 1-99-ig terjedhet!')
      }
      if(newCoupon.code == ''){
        errors.push('Kuponkód megadása kötelező')
      }
      if(!couponRegex.test(newCoupon.code)){
        errors.push('Hibás kuponkód! Példa: ABCD-123456')
      }


      const cim = newCoupon.title;
      const kedvezmenySzazalek: number = newCoupon.percentage;
      const kuponKod = newCoupon.code;
      
      if(errors.length > 0){
        return {
          errors,
        };
      } else {
        const [adatok] = await conn.execute(
          'INSERT INTO kedvezmeny (title, percentage, code) VALUES (?, ?, ?)',
          [cim, kedvezmenySzazalek, kuponKod]
        );
        console.log(adatok)
        res.redirect('/')
      }
  }

  @Post('/coupondelete')
  async couponDelete(@Param('id') id: number) {
    const [adatok] = await conn.execute(
      'DELETE FROM kedvezmeny WHERE id = ?',
      [id]
    );
  }
}
