Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2346C1F87B6
	for <lists+cocci@lfdr.de>; Sun, 14 Jun 2020 10:49:44 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 05E8nR5I000614;
	Sun, 14 Jun 2020 10:49:27 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 0F3017814;
	Sun, 14 Jun 2020 10:49:27 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 27F5644A7
 for <cocci@systeme.lip6.fr>; Sun, 14 Jun 2020 10:49:25 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 05E8nN5K024419
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Sun, 14 Jun 2020 10:49:23 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,510,1583190000"; d="scan'208";a="351533373"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jun 2020 10:49:23 +0200
Date: Sun, 14 Jun 2020 10:49:23 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Mike Galbraith <umgwanakikbuti@gmail.com>
In-Reply-To: <1592122310.2129.14.camel@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2006141048070.2849@hadrien>
References: <b14e6d1d-afa0-5c28-547a-9bb1a987f6fd@infradead.org>
 <1592115803.27290.33.camel@gmail.com>
 <alpine.DEB.2.22.394.2006140940000.2849@hadrien>
 <1592121432.2129.9.camel@gmail.com> <1592121650.2129.11.camel@gmail.com>
 <1592122310.2129.14.camel@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 14 Jun 2020 10:49:27 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sun, 14 Jun 2020 10:49:23 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Randy Dunlap <rdunlap@infradead.org>, cocci@systeme.lip6.fr
Subject: Re: [Cocci] coccinelle issues
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



On Sun, 14 Jun 2020, Mike Galbraith wrote:

> On Sun, 2020-06-14 at 10:00 +0200, Mike Galbraith wrote:
> > On Sun, 2020-06-14 at 09:57 +0200, Mike Galbraith wrote:
> > > On Sun, 2020-06-14 at 09:42 +0200, Julia Lawall wrote:
> > > >
> > > > On Sun, 14 Jun 2020, Mike Galbraith wrote:
> > > >
> > > >
> > > > > I didn't download, rather pulled/built.  I didn't have the same issue
> > > > > you did, but make coccicheck was a bust here until I backed down to
> > > > > version 1.0.6.  Neither HEAD, 1.0.8 or 1.0.7 ran, and following its
> > > > > MODE=blah suggestion helped not at all.
> > > >
> > > > Did you get a segmentation fault?
> > >
> > > Nope.  Turned out to be a dinky install gotcha.  Creating a symlink..
> > >
> > > lrwxrwxrwx 1 root root 27 Jun 14 09:40 /usr/local/coccinelle/lib -> /usr/local/coccinelle/lib64
> > >
> > > ..seems to have fixed 1.0.8 all up.  The very first time I installed, I
> > > had to create one directory (forget which) by hand as well.
> >
> > Oh well, not all fixed up, but it does run.
> >
> > ./fs/xfs/xfs_rmap_item.c:56:5-24: atomic_dec_and_test variation before object free at line 57.
> > ./kernel/nsproxy.c:253:11-30: atomic_dec_and_test variation before object free at line 254.
> > ./net/unix/scm.c:80:6-30: atomic_dec_and_test variation before object free at line 81.
> > coccicheck failed
> > make: *** [Makefile:1822: coccicheck] Error 2
>
> And doing the DEBUG_FILE="all.err" thing says...
>
> /usr/local/bin/spatch -D report --no-show-diff --very-quiet --cocci-file ./scripts/coccinelle/api/alloc/alloc_cast.cocci --no-includes --include-headers --dir . -I ./arch/x86/include -I ./arch/x86/include/generated -I ./include -I ./arc>
> 12712 files match
> /usr/local/bin/spatch -D report --no-show-diff --very-quiet --cocci-file ./scripts/coccinelle/api/alloc/pool_zalloc-simple.cocci --no-includes --include-headers --dir . -I ./arch/x86/include -I ./arch/x86/include/generated -I ./include >
> 42 files match
> /usr/local/bin/spatch -D report --no-show-diff --very-quiet --cocci-file ./scripts/coccinelle/api/alloc/zalloc-simple.cocci --no-includes --include-headers --dir . -I ./arch/x86/include -I ./arch/x86/include/generated -I ./include -I ./>
> 2003 files match
> /usr/local/bin/spatch -D report --no-show-diff --very-quiet --cocci-file ./scripts/coccinelle/api/atomic_as_refcounter.cocci --include-headers --very-quiet --dir . -I ./arch/x86/include -I ./arch/x86/include/generated -I ./include -I ./>
> 502 files match
> /usr/local/bin/spatch -D report --no-show-diff --very-quiet --cocci-file ./scripts/coccinelle/api/check_bq27xxx_data.cocci --dir . -I ./arch/x86/include -I ./arch/x86/include/generated -I ./include -I ./arch/x86/include/uapi -I ./arch/x>
> File "/tmp/ocaml_cocci_c0ec37.ml", line 1:
> Error: The files /usr/local/coccinelle/bin/../lib/coccinelle/ocaml/coccilib.cmi
>        and /usr/local/coccinelle/bin/../lib/coccinelle/ocaml/ast_c.cmi
>        make inconsistent assumptions over interface Ast_c
> Fatal error: exception Coccinelle_modules.Yes_prepare_ocamlcocci.CompileFailure("/tmp/ocaml_cocci_c0ec37.ml")
> ~

Ah, that's not what I expected.  It looks like your lib problem coming
back again.

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
