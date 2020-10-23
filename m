Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5120C296980
	for <lists+cocci@lfdr.de>; Fri, 23 Oct 2020 08:06:15 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 09N65p9r016311;
	Fri, 23 Oct 2020 08:05:51 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 2D22877BF;
	Fri, 23 Oct 2020 08:05:51 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 2527745D8
 for <cocci@systeme.lip6.fr>; Fri, 23 Oct 2020 08:05:49 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 09N65mq1016709
 for <cocci@systeme.lip6.fr>; Fri, 23 Oct 2020 08:05:48 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.77,407,1596492000"; d="scan'208";a="362551595"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Oct 2020 08:05:48 +0200
Date: Fri, 23 Oct 2020 08:05:48 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Mansour Moufid <mansourmoufid@gmail.com>
In-Reply-To: <CALogXGVr7OYtWhrsZg7gnO+czzu6eM_GGThYSCYezgUmVjwqZA@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2010230805030.2707@hadrien>
References: <CALogXGVr7OYtWhrsZg7gnO+czzu6eM_GGThYSCYezgUmVjwqZA@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 23 Oct 2020 08:05:53 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Fri, 23 Oct 2020 08:05:48 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] Newline escape in preprocessor
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



On Thu, 22 Oct 2020, Mansour Moufid wrote:

> Hi,
>
> I'd like to add a statement after another within a preprocessor
> expression, but spatch adds the line without an escape (backslash).
>
> x.c:
>
>     #define X(a) x(a);
>
> (I know the above is not technically correct but it's super common.)
>
> x.cocci:
>
>     @@
>     expression e;
>     @@
>         x(e);
>     +   y(e);
>
> output:
>
>     $ spatch --sp-file x.cocci x.c
>     HANDLING: x.c
>     diff =
>     --- x.c
>     +++ /tmp/cocci-output-80658-7f90b1-x.c
>     @@ -1 +1,2 @@
>      #define X(a) x(a);
>     +y(a);
>
> I can think of two solutions, if an expression is inside a
> preprocessor statement: add a backslash before every newline, or skip
> the newline.

Indeed Coccinelle is not aware that the added code is within a #define.
Maybe it is easy to add that.

Thanks for the report.

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
