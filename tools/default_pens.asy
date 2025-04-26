/******************************************************************************
 *                                  LICENSE                                   *
 ******************************************************************************
 *  This file is part of asymptote_figures.                                   *
 *                                                                            *
 *  asymptote_figures is free software: you can redistribute it and/or        *
 *  modify it under the terms of the GNU General Public License as published  *
 *  by the Free Software Foundation, either version 3 of the License, or      *
 *  (at your option) any later version.                                       *
 *                                                                            *
 *  asymptote_figures is distributed in the hope that it will be useful       *
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of            *
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the             *
 *  GNU General Public License for more details.                              *
 *                                                                            *
 *  You should have received a copy of the GNU General Public License         *
 *  along with asymptote_figures. If not see <https://www.gnu.org/licenses/>. *
 ******************************************************************************
 *  Purpose:                                                                  *
 *      Provides commonly used pens. This should NOT be "imported", you'll    *
 *      get a lot of errors. Instead, certain parameters like "line_width"    *
 *      and "label_size" must be defined in your file, and then you "include" *
 *      this. The "size_xxx_default_settings.asy" files make use of this.     *
 ******************************************************************************/

/*  Create the default pen that is called by "draw" when no pen is specified. */
defaultpen(black + line_width + label_size);

/*  Thinner and thicker alternatives that are commonly required.              */
pen thin_pen = black + thin_line_width + label_size;
pen thick_pen = black + thick_line_width + label_size;

/*  Dashed variants of the previous pens.                                     */
pen thin_dash_pen = thin_pen + dash_type;
pen dash_pen = defaultpen + dash_type;
pen thick_dash_pen = thick_pen + dash_type;

/*  Blue variants of the previously defined pens.                             */
pen blue_thin_pen = blue + thin_line_width + label_size;
pen blue_pen = blue + line_width + label_size;
pen blue_thick_pen = blue + thick_line_width + label_size;

pen blue_thin_dash_pen = blue_thin_pen + dash_type;
pen blue_dash_pen = blue_pen + dash_type;
pen blue_thick_dash_pen = blue_thick_pen + dash_type;

/*  Green variants of the previously defined pens.                            */
pen green_thin_pen = green + thin_line_width + label_size;
pen green_pen = green + line_width + label_size;
pen green_thick_pen = green + thick_line_width + label_size;

pen green_thin_dash_pen = green_thin_pen + dash_type;
pen green_dash_pen = green_pen + dash_type;
pen green_thick_dash_pen = green_thick_pen + dash_type;

/*  Red variants of the previously defined pens.                              */
pen red_thin_pen = red + thin_line_width + label_size;
pen red_pen = red + line_width + label_size;
pen red_thick_pen = red + thick_line_width + label_size;

pen red_thin_dash_pen = red_thin_pen + dash_type;
pen red_dash_pen = red_pen + dash_type;
pen red_thick_dash_pen = red_thick_pen + dash_type;

/*  Yellow variants of the previously defined pens.                           */
pen yellow_thin_pen = yellow + thin_line_width + label_size;
pen yellow_pen = yellow + line_width + label_size;
pen yellow_thick_pen = yellow + thick_line_width + label_size;

pen yellow_thin_dash_pen = yellow_thin_pen + dash_type;
pen yellow_dash_pen = yellow_pen + dash_type;
pen yellow_thick_dash_pen = yellow_thick_pen + dash_type;

/*  Purple variants of the previously defined pens.                           */
pen purple_thin_pen = purple + thin_line_width + label_size;
pen purple_pen = purple + line_width + label_size;
pen purple_thick_pen = purple + thick_line_width + label_size;

pen purple_thin_dash_pen = purple_thin_pen + dash_type;
pen purple_dash_pen = purple_pen + dash_type;
pen purple_thick_dash_pen = purple_thick_pen + dash_type;

/*  Cyan variants of the previously defined pens.                             */
pen cyan_thin_pen = cyan + thin_line_width + label_size;
pen cyan_pen = cyan + line_width + label_size;
pen cyan_thick_pen = cyan + thick_line_width + label_size;

pen cyan_thin_dash_pen = cyan_thin_pen + dash_type;
pen cyan_dash_pen = cyan_pen + dash_type;
pen cyan_thick_dash_pen = cyan_thick_pen + dash_type;

/*  Magenta variants of the previously defined pens.                          */
pen magenta_thin_pen = magenta + thin_line_width + label_size;
pen magenta_pen = magenta + line_width + label_size;
pen magenta_thick_pen = magenta + thick_line_width + label_size;

pen magenta_thin_dash_pen = magenta_thin_pen + dash_type;
pen magenta_dash_pen = magenta_pen + dash_type;
pen magenta_thick_dash_pen = magenta_thick_pen + dash_type;

/*  Gray variants of the previously defined pens.                             */
pen gray_thin_pen = gray(0.5) + thin_line_width + label_size;
pen gray_pen = gray(0.5)  + line_width + label_size;
pen gray_thick_pen = gray(0.5)  + thick_line_width + label_size;

pen gray_thin_dash_pen = gray_thin_pen + dash_type;
pen gray_dash_pen = gray_pen + dash_type;
pen gray_thick_dash_pen = gray_thick_pen + dash_type;
pen gray_transparent_pen = gray_pen + opacity(0.5);

/*  Light-gray variants of the previously defined pens.                       */
pen light_gray_thin_pen = gray(0.8) + thin_line_width + label_size;
pen light_gray_pen = gray(0.8)  + line_width + label_size;
pen light_gray_thick_pen = gray(0.8)  + thick_line_width + label_size;

pen light_gray_thin_dash_pen = light_gray_thin_pen + dash_type;
pen light_gray_dash_pen = light_gray_pen + dash_type;
pen light_gray_thick_dash_pen = light_gray_thick_pen + dash_type;
pen light_gray_transparent_pen = light_gray_pen + opacity(0.5);

/*  Pen used for very large labels. Used in some equations with knots.        */
pen massive_pen = black + line_width + fontsize(32pt);
