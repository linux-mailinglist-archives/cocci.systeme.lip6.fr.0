Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA49610DB
	for <lists+cocci@lfdr.de>; Sat,  6 Jul 2019 15:39:35 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x66DdG1a017796;
	Sat, 6 Jul 2019 15:39:16 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id BBA9F778F;
	Sat,  6 Jul 2019 15:39:15 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 9918E777A
 for <cocci@systeme.lip6.fr>; Sat,  6 Jul 2019 15:39:13 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x66DdC0g004830
 for <cocci@systeme.lip6.fr>; Sat, 6 Jul 2019 15:39:12 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.63,458,1557180000"; d="scan'208";a="312640623"
Received: from abo-12-105-68.mrs.modulonet.fr (HELO hadrien) ([85.68.105.12])
 by mail3-relais-sop.national.inria.fr with
 ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Jul 2019 15:39:12 +0200
Date: Sat, 6 Jul 2019 15:39:11 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: Masahiro Yamada <yamada.masahiro@socionext.com>
In-Reply-To: <CAK7LNARTJpxRmQzx+vQGfOC5YFuw8QsRQ=_9=9E=g5p62UUf6g@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.1907061538580.2523@hadrien>
References: <20190406061112.31620-1-himanshujha199640@gmail.com>
 <alpine.DEB.2.21.1904060831120.4486@hadrien>
 <alpine.DEB.2.21.1904060833160.4486@hadrien>
 <CAK7LNARTJpxRmQzx+vQGfOC5YFuw8QsRQ=_9=9E=g5p62UUf6g@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sat, 06 Jul 2019 15:39:17 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Sat, 06 Jul 2019 15:39:12 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: kernel-janitors@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Nicolas Palix <nicolas.palix@imag.fr>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        cocci@systeme.lip6.fr
Subject: Re: [Cocci] [PATCH] coccinelle: api: add
 devm_platform_ioremap_resource script
X-BeenThere: cocci@systeme.lip6.fr
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: <cocci.systeme.lip6.fr>
List-Unsubscribe: <https://systeme.lip6.fr/mailman/options/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=unsubscribe>
List-Archive: <https://systeme.lip6.fr/pipermail/cocci>
List-Post: <mailto:cocci@systeme.lip6.fr>
List-Help: <mailto:cocci-request@systeme.lip6.fr?subject=help>
List-Subscribe: <https://systeme.lip6.fr/mailman/listinfo/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr



On Sat, 6 Jul 2019, Masahiro Yamada wrote:

> On Sat, Apr 6, 2019 at 3:34 PM Julia Lawall <julia.lawall@lip6.fr> wrote:
> >
> >
> >
> > On Sat, 6 Apr 2019, Julia Lawall wrote:
> >
> > >
> > >
> > > On Sat, 6 Apr 2019, Himanshu Jha wrote:
> > >
> > > > Use recently introduced devm_platform_ioremap_resource
> > > > helper which wraps platform_get_resource() and
> > > > devm_ioremap_resource() together. This helps produce much
> > > > cleaner code while removing local `struct resource` declaration.
> > > >
> > > > Signed-off-by: Himanshu Jha <himanshujha199640@gmail.com>
> > >
> > > Acked-by: Julia Lawall <julia.lawall@lip6.fr>
> > >
> > > Thanks for taking up this issue.
> >
> > Maybe this should be
> >
> > Signed-off-by: Julia Lawall <julia.lawall@lip6.fr>
> >
> > since I contributed two lines to the script :)
>
> I will apply with Julia's Signed-off-by instead of Acked-by.
> I will also add SPDX tag.
>
> Is this OK?

Yes, thanks.

julia

>
>
>
> > julia
> >
> > >
> > > julia
> > >
> > > > ---
> > > >
> > > > Tree wide changes has been tested through 0-day test service
> > > > with build success.
> > > >
> > > > BUILD SUCCESS 74ebaaca5d14d3d9b03e911f0b4995b78a4d60f0
> > > > tree/branch: https://github.com/himanshujha199640/linux-next  20190401-devm_platform_ioremap_resource-final
> > > > branch HEAD: 74ebaaca5d14d3d9b03e911f0b4995b78a4d60f0  Coccinelle: api: Add devm_platform_ioremap_resource.cocci
> > > >
> > > > elapsed time: 385m
> > > > configs tested: 162
> > > >
> > > >
> > > > Stats:
> > > > 916 files changed, 1028 insertions(+), 2921 deletions(-)
> > > >
> > > > Note: cases where the `struct resource *res` variable is
> > > > used subsequently in the function have been ignored out because
> > > > those cases produce:
> > > >
> > > > eg., drivers/bus/da8xx-mstpri.c
> > > >
> > > > warning: 'res' may be used uninitialized in this function [-Wmaybe-uninitialized]
> > > >
> > > > due to:
> > > >     if (prio_descr->reg + sizeof(u32) > resource_size(res)) {
> > > >
> > > > which seems correct as `res` isn't initialized in the scope of
> > > > the function(da8xx_mstpri_probe) and instead initialized inside:
> > > >
> > > >    void __iomem *devm_platform_ioremap_resource(struct platform_device *pdev,
> > > >                                                 unsigned int index)
> > > >    {
> > > >            struct resource *res;
> > > >
> > > >            res = platform_get_resource(pdev, IORESOURCE_MEM, index);
> > > >            return devm_ioremap_resource(&pdev->dev, res);
> > > >    }
> > > >    EXPORT_SYMBOL_GPL(devm_platform_ioremap_resource);
> > > >
> > > >
> > > >  .../api/devm_platform_ioremap_resource.cocci  | 63 +++++++++++++++++++
> > > >  1 file changed, 63 insertions(+)
> > > >  create mode 100644 scripts/coccinelle/api/devm_platform_ioremap_resource.cocci
> > > >
> > > > diff --git a/scripts/coccinelle/api/devm_platform_ioremap_resource.cocci b/scripts/coccinelle/api/devm_platform_ioremap_resource.cocci
> > > > new file mode 100644
> > > > index 000000000000..a28274af14df
> > > > --- /dev/null
> > > > +++ b/scripts/coccinelle/api/devm_platform_ioremap_resource.cocci
> > > > @@ -0,0 +1,63 @@
> > > > +/// Use devm_platform_ioremap_resource helper which wraps
> > > > +/// platform_get_resource() and devm_ioremap_resource() together.
> > > > +///
> > > > +// Confidence: High
> > > > +// Copyright: (C) 2019 Himanshu Jha GPLv2.
> > > > +// Copyright: (C) 2019 Julia Lawall, Inria/LIP6. GPLv2.
> > > > +// Keywords: platform_get_resource, devm_ioremap_resource,
> > > > +// Keywords: devm_platform_ioremap_resource
> > > > +
> > > > +virtual patch
> > > > +virtual report
> > > > +
> > > > +@r depends on patch && !report@
> > > > +expression e1, e2, arg1, arg2, arg3, arg4;
> > > > +identifier id;
> > > > +@@
> > > > +
> > > > +(
> > > > +- id = platform_get_resource(arg1, arg2, arg3);
> > > > +|
> > > > +- struct resource *id = platform_get_resource(arg1, arg2, arg3);
> > > > +)
> > > > +  ... when != id
> > > > +- e1 = devm_ioremap_resource(arg4, id);
> > > > ++ e1 = devm_platform_ioremap_resource(arg1, arg3);
> > > > +  ... when != id
> > > > +? id = e2
> > > > +
> > > > +@r1 depends on patch && !report@
> > > > +identifier r.id;
> > > > +type T;
> > > > +@@
> > > > +
> > > > +- T *id;
> > > > +  ...when != id
> > > > +
> > > > +// ----------------------------------------------------------------------------
> > > > +
> > > > +@r2 depends on report && !patch@
> > > > +identifier id;
> > > > +expression e1, e2, arg1, arg2, arg3, arg4;
> > > > +position j0;
> > > > +@@
> > > > +
> > > > +(
> > > > +  id = platform_get_resource(arg1, arg2, arg3);
> > > > +|
> > > > +  struct resource *id = platform_get_resource(arg1, arg2, arg3);
> > > > +)
> > > > +  ... when != id
> > > > +  e1@j0 = devm_ioremap_resource(arg4, id);
> > > > +  ... when != id
> > > > +? id = e2
> > > > +
> > > > +// ----------------------------------------------------------------------------
> > > > +
> > > > +@script:python depends on report && !patch@
> > > > +e1 << r2.e1;
> > > > +j0 << r2.j0;
> > > > +@@
> > > > +
> > > > +msg = "WARNING: Use devm_platform_ioremap_resource for %s" % (e1)
> > > > +coccilib.report.print_report(j0[0], msg)
> > > > --
> > > > 2.17.1
> > > >
> > > >
> > >
> > _______________________________________________
> > Cocci mailing list
> > Cocci@systeme.lip6.fr
> > https://systeme.lip6.fr/mailman/listinfo/cocci
>
>
>
> --
> Best Regards
> Masahiro Yamada
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
