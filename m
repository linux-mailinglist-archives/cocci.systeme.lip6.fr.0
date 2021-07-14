Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C703C7E7C
	for <lists+cocci@lfdr.de>; Wed, 14 Jul 2021 08:23:29 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 16E6N1Ps027676;
	Wed, 14 Jul 2021 08:23:01 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 931FA77F5;
	Wed, 14 Jul 2021 08:23:01 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 528F94065
 for <cocci@systeme.lip6.fr>; Wed, 14 Jul 2021 08:22:59 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 16E6Mwaq017731
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Wed, 14 Jul 2021 08:22:58 +0200 (CEST)
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3A/Ez+NaNMwdRF/cBcTsajsMiBIKoaSvp037BL?=
 =?us-ascii?q?7TEUdfU7SKelfqyV9sjzkCWUtN9zYgBEpTnjAsm9qBrnnPZICMsqTNSftWLd1l?=
 =?us-ascii?q?dAQrsP0WKv+UyDJwTOst8Y76tmfqRkYeecMXFxh6/BjzWFLw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.84,238,1620684000"; d="scan'208";a="519877855"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jul 2021 08:22:43 +0200
Date: Wed, 14 Jul 2021 08:22:42 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Joe Perches <joe@perches.com>
In-Reply-To: <42a843710a652e110b71ab6beafc3a3e6e11dfd3.camel@perches.com>
Message-ID: <alpine.DEB.2.22.394.2107140821140.2917@hadrien>
References: <08b89608cfb1280624d1a89ead6547069f9a4c31.camel@perches.com>
 <alpine.DEB.2.22.394.2107102149140.46528@hadrien>
 <afd3a282ca57a4a400c8bae9879a7c57bc507c59.camel@perches.com>
 <alpine.DEB.2.22.394.2107132332030.3024@hadrien>
 <42a843710a652e110b71ab6beafc3a3e6e11dfd3.camel@perches.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 14 Jul 2021 08:23:03 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 14 Jul 2021 08:22:58 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: kernel-janitors@vger.kernel.org, cocci <cocci@systeme.lip6.fr>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [Cocci] cocci script to convert linux-kernel allocs with
 BITS_TO_LONGS to bitmap_alloc
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



On Tue, 13 Jul 2021, Joe Perches wrote:

> On Tue, 2021-07-13 at 23:33 +0200, Julia Lawall wrote:
> > > > On Fri, 9 Jul 2021, Joe Perches wrote:
> > > > > Here is a cocci script to convert various types of bitmap allocations
> > > > > that use BITS_TO_LONGS to the more typical bitmap_alloc functions.
> >
> > I see that there is also a bitmap_free.  Maybe the rule should be
> > introducing that as well?
>
> Yes, but as far as I know, it's difficult for coccinelle to convert
> the kfree() calls of any previous bitmap_alloc to bitmap_free as
> most frequently the kfree() call is in a separate function.

Often the code says a->b = foo(); and then the a->b in another function is
the same one that was the result of foo().  One could check that this is
the only assignment to a->b in the file for more confidence.

I'll add it to the rule and see how it goes.

julia

>
> Please do it if you know how, you're probably the best in the world
> at coccinelle.  I don't know how...
>
> cheers, Joe
>
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
