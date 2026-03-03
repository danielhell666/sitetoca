import 'package:flutter/material.dart';
import 'package:toca_do_tamandua_site/sections/botton_info_section.dart';
import 'package:toca_do_tamandua_site/sections/clinic_description_section.dart';
import 'package:toca_do_tamandua_site/sections/faq_section.dart';
import 'package:toca_do_tamandua_site/sections/specialities_section.dart';
import 'package:toca_do_tamandua_site/sections/team_section.dart';
import 'package:toca_do_tamandua_site/sections/testimonials_section.dart';
import 'package:toca_do_tamandua_site/widgets/site_signature.dart';
import 'package:toca_do_tamandua_site/widgets/whatsapp_floating_button.dart';

import '../../data/section_anchors.dart';
import '../../widgets/top_bar.dart';

import '../../widgets/image_carousel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> _goTo(HomeSection section) async {
    final ctx = sectionKeys[section]?.currentContext;
    if (ctx == null) return;

    await Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 550),
      curve: Curves.easeOutCubic,
      alignment: 0.08,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
          children: [
            TopBar(onNavigate: _goTo),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final width = constraints.maxWidth * 0.85;
        
                  return ListView(
                    padding: const EdgeInsets.all(18),
                    children: [
                      Center(
                        child: SizedBox(
                          width: width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 6),
                              Container(
                                key: sectionKeys[HomeSection.inicio],
                                child: const ImageCarousel(),
                              ),
                              const SizedBox(height: 32),
                              Container(
                                key: sectionKeys[HomeSection.quemsomos],
                                child: const ClinicDescriptionSection(),
                              ),
                              const SizedBox(height: 32),
                              Container(
                                key: sectionKeys[HomeSection.especialidades],
                                child: const SpecialtiesSection(),
                              ),
                              const SizedBox(height: 32),
                              Container(
                                key: sectionKeys[HomeSection.equipe],
                                child: const TeamSection(),
                              ),
                              const SizedBox(height: 32),
                              Container(
                                key: sectionKeys[HomeSection.depoimentos],
                                child: const TestimonialsSection(),
                              ),
                              const SizedBox(height: 28),
                              Container(
                                key: sectionKeys[HomeSection.duvidas],
                                child: const FaqSection(),
                              ),
                              const SizedBox(height: 32),
                              Container(
                                key: sectionKeys[HomeSection.contato],
                                child: const BottonInfoSection(),
                              ),
                              const SizedBox(height: 40),
                              SiteSignature()
                              
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: const WhatsAppFloatingButton(),
        )
        ]
      ),
    );
  }
}
