Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED53331965
	for <lists+cocci@lfdr.de>; Mon,  8 Mar 2021 22:33:02 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 128LUYuL008933;
	Mon, 8 Mar 2021 22:30:34 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id B435477E2;
	Mon,  8 Mar 2021 22:30:34 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 267CD3BA2
 for <cocci@systeme.lip6.fr>; Mon,  8 Mar 2021 22:30:33 +0100 (CET)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 128LUWO1024254
 for <cocci@systeme.lip6.fr>; Mon, 8 Mar 2021 22:30:32 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.81,233,1610406000"; d="scan'208";a="375142415"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Mar 2021 22:30:31 +0100
Date: Mon, 8 Mar 2021 22:30:31 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Denis Efremov <efremov@linux.com>
In-Reply-To: <20210308070445.104768-1-efremov@linux.com>
Message-ID: <alpine.DEB.2.22.394.2103082226540.15999@hadrien>
References: <20210216160326.1341741-1-efremov@linux.com>
 <20210308070445.104768-1-efremov@linux.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 08 Mar 2021 22:30:37 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Mon, 08 Mar 2021 22:30:32 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr, linux-kernel@vger.kernel.org
Subject: Re: [Cocci] [PATCH v4] coccinelle: misc: add minmax script
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

> +@pmaxif depends on patch@
> +identifier func;
> +expression x, y;
> +expression max_val;
> +binary operator cmp = {>=, >};
> +@@
> +
> +func(...)
> +{
> +	<...
> +-	if ((x) cmp (y)) {
> +-		max_val = (x);
> +-	} else {
> +-		max_val = (y);
> +-	}
> ++	max_val = max(x, y);
> +	...>
> +}

Things work better if there are no parentheses in max_val = (x) and
max_val = (y).  Leaving them there seems to cause the match to work in two
ways, causing an already tagged token error.  An example is in
crypto/jitterentropy.c

The same is true of the pminif rule.  Only the patch rules are affected.
Double matches are allowed in the context cas, ince there is no real
transfotmation in that case.

julia

> +
> +@pmin depends on patch@
> +identifier func;
> +expression x, y;
> +binary operator cmp = {<=, <};
> +@@
> +
> +func(...)
> +{
> +	<...
> +-	((x) cmp (y) ? (x) : (y))
> ++	min(x, y)
> +	...>
> +}
> +
> +@pminif depends on patch@
> +identifier func;
> +expression x, y;
> +expression min_val;
> +binary operator cmp = {<=, <};
> +@@
> +
> +func(...)
> +{
> +	<...
> +-	if ((x) cmp (y)) {
> +-		min_val = (x);
> +-	} else {
> +-		min_val = (y);
> +-	}
> ++	min_val = min(x, y);
> +	...>
> +}
> +
> +@script:python depends on report@
> +p << rmax.p;
> +@@
> +
> +for p0 in p:
> +	coccilib.report.print_report(p0, "WARNING opportunity for max()")
> +
> +@script:python depends on org@
> +p << rmax.p;
> +@@
> +
> +for p0 in p:
> +	coccilib.org.print_todo(p0, "WARNING opportunity for max()")
> +
> +@script:python depends on report@
> +p << rmaxif.p;
> +@@
> +
> +for p0 in p:
> +	coccilib.report.print_report(p0, "WARNING opportunity for max()")
> +
> +@script:python depends on org@
> +p << rmaxif.p;
> +@@
> +
> +for p0 in p:
> +	coccilib.org.print_todo(p0, "WARNING opportunity for max()")
> +
> +@script:python depends on report@
> +p << rmin.p;
> +@@
> +
> +for p0 in p:
> +	coccilib.report.print_report(p0, "WARNING opportunity for min()")
> +
> +@script:python depends on org@
> +p << rmin.p;
> +@@
> +
> +for p0 in p:
> +	coccilib.org.print_todo(p0, "WARNING opportunity for min()")
> +
> +@script:python depends on report@
> +p << rminif.p;
> +@@
> +
> +for p0 in p:
> +	coccilib.report.print_report(p0, "WARNING opportunity for min()")
> +
> +@script:python depends on org@
> +p << rminif.p;
> +@@
> +
> +for p0 in p:
> +	coccilib.org.print_todo(p0, "WARNING opportunity for min()")
> --
> 2.26.2
>
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
