Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C7331E125
	for <lists+cocci@lfdr.de>; Wed, 17 Feb 2021 22:18:30 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 11HLI0i5029474;
	Wed, 17 Feb 2021 22:18:00 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id EC3EA77D9;
	Wed, 17 Feb 2021 22:17:59 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 8A78824DD
 for <cocci@systeme.lip6.fr>; Wed, 17 Feb 2021 22:17:57 +0100 (CET)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 11HLHuH8027681
 for <cocci@systeme.lip6.fr>; Wed, 17 Feb 2021 22:17:57 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.81,185,1610406000"; d="scan'208";a="373371849"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 22:17:56 +0100
Date: Wed, 17 Feb 2021 22:17:56 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Denis Efremov <efremov@linux.com>
In-Reply-To: <20210216160326.1341741-1-efremov@linux.com>
Message-ID: <alpine.DEB.2.22.394.2102172208030.3081@hadrien>
References: <20210216160326.1341741-1-efremov@linux.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 17 Feb 2021 22:18:01 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 17 Feb 2021 22:17:57 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr, linux-kernel@vger.kernel.org
Subject: Re: [Cocci] [PATCH] coccinelle: misc: add minmax script
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



On Tue, 16 Feb 2021, Denis Efremov wrote:

> Check for opencoded min(), max() implementations.

Some cases that could be improved:

diff -u -p a/drivers/platform/x86/asus-laptop.c
b/drivers/platform/x86/asus-laptop.c
--- a/drivers/platform/x86/asus-laptop.c
+++ b/drivers/platform/x86/asus-laptop.c
@@ -1195,7 +1195,7 @@ static ssize_t ls_level_store(struct dev
        if (rv < 0)
                return rv;

-       value = (0 < value) ? ((15 < value) ? 15 : value) : 0;
+       value = (0 < value) ? (min(15, value)) : 0;
        /* 0 <= value <= 15 */
        asus_als_level(asus, value);


diff -u -p a/sound/pci/ctxfi/ctatc.c b/sound/pci/ctxfi/ctatc.c
--- a/sound/pci/ctxfi/ctatc.c
+++ b/sound/pci/ctxfi/ctatc.c
@@ -382,7 +382,7 @@ static int atc_pcm_playback_start(struct
	apcm->started = 1;

        max_cisz = src->multi * src->rsc.msr;
-       max_cisz = 0x80 * (max_cisz < 8 ? max_cisz : 8);
+       max_cisz = 0x80 * (min(max_cisz, 8));


> +func(...)
> +{
> +	... when any
> +*	(x cmp y) ?@p x : y
> +	... when any
> +}

In all cases, this would be more efficient as:

func(...)
{
 <...
* (x cmp y) ?@p x : y
 ...>
}

There is an optimization that causes this to be just a search through the
nodes of the control-flow graph, rather than following the actual control
flow from the beginning of the function to the end.

> +@script:python depends on report@
> +p << rmax.p;
> +@@
> +
> +coccilib.report.print_report(p[0], "WARNING opportunity for max()")
> +
> +@script:python depends on org@
> +p << rmax.p;
> +@@
> +
> +coccilib.report.print_todo(p[0], "WARNING opportunity for max()")

All of the org cases should be coccilib.org, not coccilib.report.

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
