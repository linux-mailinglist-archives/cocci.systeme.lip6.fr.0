Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 138DA224548
	for <lists+cocci@lfdr.de>; Fri, 17 Jul 2020 22:40:19 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 06HKdrE1018538;
	Fri, 17 Jul 2020 22:39:54 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id C38CE7815;
	Fri, 17 Jul 2020 22:39:53 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 48C3F3D0F
 for <cocci@systeme.lip6.fr>; Fri, 17 Jul 2020 22:39:51 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 06HKdoes015612
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Fri, 17 Jul 2020 22:39:50 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,364,1589234400"; d="scan'208";a="354704933"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jul 2020 22:39:21 +0200
Date: Fri, 17 Jul 2020 22:39:20 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Denis Efremov <efremov@linux.com>
In-Reply-To: <20200717115709.543882-1-efremov@linux.com>
Message-ID: <alpine.DEB.2.22.394.2007172239130.2837@hadrien>
References: <20200604140805.111613-1-efremov@linux.com>
 <20200717115709.543882-1-efremov@linux.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 17 Jul 2020 22:39:56 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Fri, 17 Jul 2020 22:39:50 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr, linux-kernel@vger.kernel.org
Subject: Re: [Cocci] [PATCH v4] coccinelle: api: add kzfree script
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



On Fri, 17 Jul 2020, Denis Efremov wrote:

> Check for memset()/memzero_explicit() followed by kfree()/vfree()/kvfree().
>
> Signed-off-by: Denis Efremov <efremov@linux.com>

Applied.

> ---
> Changes in v2:
>  - memset_explicit() added
>  - kvfree_sensitive() added
>  - forall added to r1
>  - ... between memset and kfree added
> Changes in v3:
>  - Explicit filter for definitions instead of !(file in "...") conditions
>  - type T added to match casts
>  - memzero_explicit() patterns fixed
>  - additional rule "cond" added to filter false-positives
> Changes in v4:
>  - memset call fixed in rp_memset
>  - @m added to rp_memset,rp_memzero rules
>
>  scripts/coccinelle/api/kzfree.cocci | 101 ++++++++++++++++++++++++++++
>  1 file changed, 101 insertions(+)
>  create mode 100644 scripts/coccinelle/api/kzfree.cocci
>
> diff --git a/scripts/coccinelle/api/kzfree.cocci b/scripts/coccinelle/api/kzfree.cocci
> new file mode 100644
> index 000000000000..33625bd7cec9
> --- /dev/null
> +++ b/scripts/coccinelle/api/kzfree.cocci
> @@ -0,0 +1,101 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +///
> +/// Use kzfree, kvfree_sensitive rather than memset or
> +/// memzero_explicit followed by kfree
> +///
> +// Confidence: High
> +// Copyright: (C) 2020 Denis Efremov ISPRAS
> +// Options: --no-includes --include-headers
> +//
> +// Keywords: kzfree, kvfree_sensitive
> +//
> +
> +virtual context
> +virtual patch
> +virtual org
> +virtual report
> +
> +@initialize:python@
> +@@
> +# kmalloc_oob_in_memset uses memset to explicitly trigger out-of-bounds access
> +filter = frozenset(['kmalloc_oob_in_memset', 'kzfree', 'kvfree_sensitive'])
> +
> +def relevant(p):
> +    return not (filter & {el.current_element for el in p})
> +
> +@cond@
> +position ok;
> +@@
> +
> +if (...)
> +  \(memset@ok\|memzero_explicit@ok\)(...);
> +
> +@r depends on !patch forall@
> +expression E;
> +position p : script:python() { relevant(p) };
> +position m != cond.ok;
> +type T;
> +@@
> +
> +(
> +* memset@m((T)E, 0, ...);
> +|
> +* memzero_explicit@m((T)E, ...);
> +)
> +  ... when != E
> +      when strict
> +* \(kfree\|vfree\|kvfree\)(E)@p;
> +
> +@rp_memzero depends on patch@
> +expression E, size;
> +position p : script:python() { relevant(p) };
> +position m != cond.ok;
> +type T;
> +@@
> +
> +- memzero_explicit@m((T)E, size);
> +  ... when != E
> +      when strict
> +// TODO: uncomment when kfree_sensitive will be merged.
> +// Only this case is commented out because developers
> +// may not like patches like this since kzfree uses memset
> +// internally (not memzero_explicit).
> +//(
> +//- kfree(E)@p;
> +//+ kfree_sensitive(E);
> +//|
> +- \(vfree\|kvfree\)(E)@p;
> ++ kvfree_sensitive(E, size);
> +//)
> +
> +@rp_memset depends on patch@
> +expression E, size;
> +position p : script:python() { relevant(p) };
> +position m != cond.ok;
> +type T;
> +@@
> +
> +- memset@m((T)E, 0, size);
> +  ... when != E
> +      when strict
> +(
> +- kfree(E)@p;
> ++ kzfree(E);
> +|
> +- \(vfree\|kvfree\)(E)@p;
> ++ kvfree_sensitive(E, size);
> +)
> +
> +@script:python depends on report@
> +p << r.p;
> +@@
> +
> +coccilib.report.print_report(p[0],
> +  "WARNING: opportunity for kzfree/kvfree_sensitive")
> +
> +@script:python depends on org@
> +p << r.p;
> +@@
> +
> +coccilib.org.print_todo(p[0],
> +  "WARNING: opportunity for kzfree/kvfree_sensitive")
> --
> 2.26.2
>
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
