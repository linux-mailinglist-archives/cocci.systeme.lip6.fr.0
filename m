Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BFD202CDA
	for <lists+cocci@lfdr.de>; Sun, 21 Jun 2020 22:56:25 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 05LKuA88009476;
	Sun, 21 Jun 2020 22:56:10 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 138A57825;
	Sun, 21 Jun 2020 22:56:10 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 9A2423D0F
 for <cocci@systeme.lip6.fr>; Sun, 21 Jun 2020 22:56:08 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 05LKu7SJ001159
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Sun, 21 Jun 2020 22:56:07 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,264,1589234400"; d="scan'208";a="455861323"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Jun 2020 22:56:07 +0200
Date: Sun, 21 Jun 2020 22:56:07 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Denis Efremov <efremov@linux.com>
In-Reply-To: <20200619131313.15468-1-efremov@linux.com>
Message-ID: <alpine.DEB.2.22.394.2006212255140.2501@hadrien>
References: <20200615102045.4558-1-efremov@linux.com>
 <20200619131313.15468-1-efremov@linux.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 21 Jun 2020 22:56:10 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sun, 21 Jun 2020 22:56:07 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>,
        cocci@systeme.lip6.fr
Subject: Re: [Cocci] [PATCH v3] coccinelle: misc: add array_size_dup script
 to	detect missed overflow checks
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

> +@script:python depends on report@
> +p1 << as_next.p1;
> +p2 << as_next.p2;
> +@@
> +
> +coccilib.report.print_report(p1[0],
> +f"WARNING: array_size is used down the code (line {p2[0].line}) to compute the same size")

I get python failures for all of these messages.  I know nothing about
python.  How is this supposed to work?  Is it a python 2 vs python 3
thing?

julia


> +
> +@script:python depends on org@
> +p1 << as_next.p1;
> +p2 << as_next.p2;
> +@@
> +
> +coccilib.org.print_todo(p1[0],
> +f"WARNING: array_size is used down the code (line {p2[0].line}) to compute the same size")
> +
> +@as_prev@
> +expression subE1 <= as.E1;
> +expression subE2 <= as.E2;
> +expression as.E1, as.E2, E3;
> +assignment operator aop;
> +position p1, p2;
> +@@
> +
> +* array_size(E1, E2)@p1
> +  ... when != \(E1\|E2\|subE1\|subE2\) aop E3
> +      when != &\(E1\|E2\|subE1\|subE2\)
> +* E1 * E2@p2
> +
> +@script:python depends on report@
> +p1 << as_prev.p1;
> +p2 << as_prev.p2;
> +@@
> +
> +coccilib.report.print_report(p2[0],
> +f"WARNING: array_size is already used (line {p1[0].line}) to compute the same size")
> +
> +@script:python depends on org@
> +p1 << as_prev.p1;
> +p2 << as_prev.p2;
> +@@
> +
> +coccilib.org.print_todo(p2[0],
> +f"WARNING: array_size is already used (line {p1[0].line}) to compute the same size")
> +
> +@as_dup@
> +expression subE1 <= as.E1;
> +expression subE2 <= as.E2;
> +expression as.E1, as.E2, E3;
> +assignment operator aop;
> +position p1, p2;
> +@@
> +
> +* array_size(E1, E2)@p1
> +  ... when != \(E1\|E2\|subE1\|subE2\) aop E3
> +      when != &\(E1\|E2\|subE1\|subE2\)
> +* array_size(E1, E2)@p2
> +
> +@script:python depends on report@
> +p1 << as_dup.p1;
> +p2 << as_dup.p2;
> +@@
> +
> +coccilib.report.print_report(p2[0],
> +f"WARNING: same array_size (line {p1[0].line})")
> +
> +@script:python depends on org@
> +p1 << as_dup.p1;
> +p2 << as_dup.p2;
> +@@
> +
> +coccilib.org.print_todo(p2[0],
> +f"WARNING: same array_size (line {p1[0].line})")
> +
> +@as3@
> +expression E1, E2, E3;
> +@@
> +
> +array3_size(E1, E2, E3)
> +
> +@as3_next@
> +expression subE1 <= as3.E1;
> +expression subE2 <= as3.E2;
> +expression subE3 <= as3.E3;
> +expression as3.E1, as3.E2, as3.E3, E4;
> +assignment operator aop;
> +position p1, p2;
> +@@
> +
> +* E1 * E2 * E3@p1
> +  ... when != \(E1\|E2\|E3\|subE1\|subE2\|subE3\) aop E4
> +      when != &\(E1\|E2\|E3\|subE1\|subE2\|subE3\)
> +* array3_size(E1, E2, E3)@p2
> +
> +@script:python depends on report@
> +p1 << as3_next.p1;
> +p2 << as3_next.p2;
> +@@
> +
> +coccilib.report.print_report(p1[0],
> +f"WARNING: array3_size is used down the code (line {p2[0].line}) to compute the same size")
> +
> +@script:python depends on org@
> +p1 << as3_next.p1;
> +p2 << as3_next.p2;
> +@@
> +
> +coccilib.org.print_todo(p1[0],
> +f"WARNING: array3_size is used down the code (line {p2[0].line}) to compute the same size")
> +
> +@as3_prev@
> +expression subE1 <= as3.E1;
> +expression subE2 <= as3.E2;
> +expression subE3 <= as3.E3;
> +expression as3.E1, as3.E2, as3.E3, E4;
> +assignment operator aop;
> +position p1, p2;
> +@@
> +
> +* array3_size(E1, E2, E3)@p1
> +  ... when != \(E1\|E2\|E3\|subE1\|subE2\|subE3\) aop E4
> +      when != &\(E1\|E2\|E3\|subE1\|subE2\|subE3\)
> +* E1 * E2 * E3@p2
> +
> +@script:python depends on report@
> +p1 << as3_prev.p1;
> +p2 << as3_prev.p2;
> +@@
> +
> +coccilib.report.print_report(p2[0],
> +f"WARNING: array3_size is already used (line {p1[0].line}) to compute the same size")
> +
> +@script:python depends on org@
> +p1 << as3_prev.p1;
> +p2 << as3_prev.p2;
> +@@
> +
> +coccilib.org.print_todo(p2[0],
> +f"WARNING: array3_size is already used (line {p1[0].line}) to compute the same size")
> +
> +@as3_dup@
> +expression subE1 <= as3.E1;
> +expression subE2 <= as3.E2;
> +expression subE3 <= as3.E3;
> +expression as3.E1, as3.E2, as3.E3, E4;
> +assignment operator aop;
> +position p1, p2;
> +@@
> +
> +* array3_size(E1, E2, E3)@p1
> +  ... when != \(E1\|E2\|E3\|subE1\|subE2\|subE3\) aop E4
> +      when != &\(E1\|E2\|E3\|subE1\|subE2\|subE3\)
> +* array3_size(E1, E2, E3)@p2
> +
> +@script:python depends on report@
> +p1 << as3_dup.p1;
> +p2 << as3_dup.p2;
> +@@
> +
> +coccilib.report.print_report(p2[0],
> +f"WARNING: same array3_size (line {p1[0].line})")
> +
> +@script:python depends on org@
> +p1 << as3_dup.p1;
> +p2 << as3_dup.p2;
> +@@
> +
> +coccilib.org.print_todo(p2[0],
> +f"WARNING: same array3_size (line {p1[0].line})")
> +
> +@ss@
> +expression E1, E2, E3;
> +@@
> +
> +struct_size(E1, E2, E3)
> +
> +@ss_next@
> +expression subE3 <= ss.E3;
> +expression ss.E1, ss.E2, ss.E3, E4;
> +assignment operator aop;
> +position p1, p2;
> +@@
> +
> +* E1 * E2 + E3@p1
> +  ... when != \(E3\|subE3\) aop E4
> +      when != &\(E3\|subE3\)
> +* struct_size(E1, E2, E3)@p2
> +
> +@script:python depends on report@
> +p1 << ss_next.p1;
> +p2 << ss_next.p2;
> +@@
> +
> +coccilib.report.print_report(p1[0],
> +f"WARNING: struct_size is used down the code (line {p2[0].line}) to compute the same size")
> +
> +@script:python depends on org@
> +p1 << ss_next.p1;
> +p2 << ss_next.p2;
> +@@
> +
> +coccilib.org.print_todo(p1[0],
> +f"WARNING: struct_size is used down the code (line {p2[0].line}) to compute the same size")
> +
> +@ss_prev@
> +expression subE3 <= ss.E3;
> +expression ss.E1, ss.E2, ss.E3, E4;
> +assignment operator aop;
> +position p1, p2;
> +@@
> +
> +* struct_size(E1, E2, E3)@p1
> +  ... when != \(E3\|subE3\) aop E4
> +      when != &\(E3\|subE3\)
> +* E1 * E2 + E3@p2
> +
> +@script:python depends on report@
> +p1 << ss_prev.p1;
> +p2 << ss_prev.p2;
> +@@
> +
> +coccilib.report.print_report(p2[0],
> +f"WARNING: struct_size is already used (line {p1[0].line}) to compute the same size")
> +
> +@script:python depends on org@
> +p1 << ss_prev.p1;
> +p2 << ss_prev.p2;
> +@@
> +
> +coccilib.org.print_todo(p2[0],
> +f"WARNING: struct_size is already used (line {p1[0].line}) to compute the same size")
> +
> +@ss_dup@
> +expression subE3 <= ss.E3;
> +expression ss.E1, ss.E2, ss.E3, E4;
> +assignment operator aop;
> +position p1, p2;
> +@@
> +
> +* struct_size(E1, E2, E3)@p1
> +  ... when != \(E3\|subE3\) aop E4
> +      when != &\(E3\|subE3\)
> +* struct_size(E1, E2, E3)@p2
> +
> +@script:python depends on report@
> +p1 << ss_dup.p1;
> +p2 << ss_dup.p2;
> +@@
> +
> +coccilib.report.print_report(p2[0],
> +f"WARNING: same struct_size (line {p1[0].line})")
> +
> +@script:python depends on org@
> +p1 << ss_dup.p1;
> +p2 << ss_dup.p2;
> +@@
> +
> +coccilib.org.print_todo(p2[0],
> +f"WARNING: same struct_size (line {p1[0].line})")
> --
> 2.26.2
>
> _______________________________________________
> Cocci mailing list
> Cocci@systeme.lip6.fr
> https://systeme.lip6.fr/mailman/listinfo/cocci
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
