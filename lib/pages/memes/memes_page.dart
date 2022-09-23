import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:simple_image_app/components/shimmer_widget.dart';
import 'package:simple_image_app/models/meme_model.dart';
import 'package:simple_image_app/pages/meme_detail/meme_detail_page.dart';
import 'package:simple_image_app/pages/memes/memes_bloc.dart';
import 'package:simple_image_app/repositories/meme_repository.dart';

class MemesPage extends StatelessWidget {
  static const route = '/memes_page';

  const MemesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'MimGenerator',
          style: GoogleFonts.mulish(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: BlocProvider<MemesBloc>(
        create: (_) => MemesBloc(
          context.read<MemeRepository>(),
        )..add(
            GetMemes(),
          ),
        child: const _MemesView(),
      ),
    );
  }
}

class _MemesView extends StatefulWidget {
  const _MemesView({Key? key}) : super(key: key);

  @override
  State<_MemesView> createState() => _MemesViewState();
}

class _MemesViewState extends State<_MemesView> {
  final RefreshController refreshCtrler = RefreshController(initialRefresh: false);

  Widget memesShimmer(BuildContext context, bool isLoading) {
    final itemWidth = (MediaQuery.of(context).size.width - 40) / 3;
    return GridView.builder(
      padding: const EdgeInsets.all(15),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, i) => ShimmerWidget(
        width: itemWidth,
        height: itemWidth,
        enabled: isLoading,
      ),
    );
  }

  Widget memesBuilder(BuildContext context, List<MemeModel> memes) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            context.read<MemesBloc>().add(
                  GetMemes(),
                );
          },
          child: const Icon(
            Icons.refresh,
            size: 24,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 15,),
        Expanded(
          child: SmartRefresher(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            enablePullDown: true,
            enablePullUp: false,
            header: const MaterialClassicHeader(),
            footer: CustomFooter(
              builder: (BuildContext context, LoadStatus? mode) {
                Widget body;

                if (mode == LoadStatus.idle) {
                  body = const Text(
                    'Pull up to load more',
                  );
                } else if (mode == LoadStatus.loading) {
                  body = const CircularProgressIndicator(
                    strokeWidth: 2,
                  );
                } else if (mode == LoadStatus.failed) {
                  body = const Text(
                    'Load failed. Please retry!',
                  );
                } else if (mode == LoadStatus.canLoading) {
                  body = const Text(
                    'Release to load more',
                  );
                } else {
                  body = const Text(
                    'All data have been loaded',
                  );
                }

                return SizedBox(
                  height: 41,
                  child: Center(child: body),
                );
              },
            ),
            controller: refreshCtrler,
            onRefresh: () {
              context.read<MemesBloc>().add(
                    GetMemes(),
                  );
            },
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, i) {
                final meme = memes[i];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MemeDetailPage(meme: meme),
                      ),
                    );
                  },
                  child: _MemeItem(
                    meme: meme,
                  ),
                );
              },
              itemCount: memes.length,
            ),
          ),
        ),
        const SizedBox(height: 15,),
      ],
    );
  }

  @override
  void dispose() {
    refreshCtrler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MemesBloc, MemesState>(
      builder: (context, state) {
        if (state.isLoading) {
          return memesShimmer(context, state.isLoading);
        } else if (state.memes.isEmpty) {
          return Center(
            child: Text(
              'Empty',
              style: GoogleFonts.mulish(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        } else {
          return memesBuilder(context, state.memes);
        }
      },
    );
  }
}

class _MemeItem extends StatelessWidget {
  final MemeModel meme;

  const _MemeItem({
    Key? key,
    required this.meme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemWidth = (MediaQuery.of(context).size.width - 40) / 3;
    final url = meme.url;
    if (url == null) {
      return Icon(
        Icons.image_outlined,
        size: itemWidth,
        color: Colors.grey,
      );
    } else {
      return Image.network(
        url,
        width: itemWidth,
        height: itemWidth,
        cacheWidth: 300,
        fit: BoxFit.cover,
        loadingBuilder: (context, widget, loadingProgress) {
          if (loadingProgress == null) return widget;
          return Center(
            child: CircularProgressIndicator(
              // color: Colors.black,
              strokeWidth: 2,
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
      );
    }
  }
}
