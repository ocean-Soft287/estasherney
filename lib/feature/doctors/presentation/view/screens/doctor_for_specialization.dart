import 'package:flutter/material.dart';

class DoctorForSpecialization extends StatelessWidget {
  const DoctorForSpecialization({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // الهيدر العلوي
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              width: double.infinity,
              height: 220,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue.shade900,
                    Colors.blue.shade500,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Column(
                children: [
                  const Text(
                    'التخصصات',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      fontFamily: "LeagueSpartan",
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'ابحث عن طبيبك',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: "LeagueSpartan",
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'ابحث...',
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // قائمة الأطباء
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: 5,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  return  Container(
                    padding: const EdgeInsets.all(12),

                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // صورة الطبيب
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                            "https://s3-alpha-sig.figma.com/img/0da1/1e17/12b0c18beb8f15818d9ed4d215ca9118?Expires=1743379200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=t7duI1TsrNp~5OlVlvpv-g0GLsPrdoJIFCh10GE9CZOvbR-fPQB8xqakGh2ZJvwXeauGgFEDj6PFHBh1VmmwMzcnv-G9CFfdOVybNmszB1IJKpDthjCj4lbpS8xrMmsDHlo4P0Zluf8OY37p-xpYk1RO6z9ShZj3IlFA-DkUObl9xTGi3CFPG0tKTPa5fwSqFS~lDVU36GZhdyIogmZ-RQfrYAmbt5HKE2qOwmpm~y~3o4u76wPLTRcDYcGWunR1VyrbhzZ8ZpFQAFSn9zy1EOeihx--GiZrHlEbhju4XRsO170nIzamMe~Pf0H0PN3h1ApPpcI~BhBVro5L~ll0xw__",
                          ),
                        ),
                        const SizedBox(width: 12),
                        // معلومات الطبيب
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            Text(
                              "د/ محمد فتحي",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,

                              ),
                              maxLines: 2,
                            ),
                            SizedBox(height: 4),
                            Text(
                              "أمراض القلب",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: (){

                                  },
                                  icon:  Icon(Icons.favorite_border, color: Colors.purple),
                                ),
                                IconButton(
                                  onPressed: () {


                                  },
                                  icon:  Icon(Icons.calendar_month, color: Colors.purple),
                                ),
                                SizedBox(
                                  width: 50
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.purple,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                  ),
                                  child: const Text(
                                    "احجز الآن",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        // أيقونات الحجز والمفضلة + زر الحجز

                  ]));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
