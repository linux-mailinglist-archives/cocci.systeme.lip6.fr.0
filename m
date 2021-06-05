Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3840739CAB0
	for <lists+cocci@lfdr.de>; Sat,  5 Jun 2021 21:13:41 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 155JDAQF016833;
	Sat, 5 Jun 2021 21:13:11 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id D7B4277F5;
	Sat,  5 Jun 2021 21:13:10 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 86EF374E8
 for <cocci@systeme.lip6.fr>; Sat,  5 Jun 2021 21:13:08 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 155JD73T015238
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Sat, 5 Jun 2021 21:13:07 +0200 (CEST)
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3A+Krlj6wQmyx29w1lFRBgKrPwWb1zdoMgy1kn?=
 =?us-ascii?q?xilNoHNuHvBw+/rCoB1k73HJYV8qMRlKpTnqAsa9qB3nn6JI3Q=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.83,251,1616454000"; d="scan'208";a="511913761"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Jun 2021 21:13:07 +0200
Date: Sat, 5 Jun 2021 21:13:06 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
In-Reply-To: <YLvDVI9TCEVoL16r@zx2c4.com>
Message-ID: <alpine.DEB.2.22.394.2106052111360.32368@hadrien>
References: <CAHmME9rRQmSLkU6ELNiC=pr-D7CGjdyw27_oXdBp+hMdn8WQ5Q@mail.gmail.com>
 <alpine.DEB.2.22.394.2106051335410.25155@hadrien>
 <YLvDVI9TCEVoL16r@zx2c4.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1137960262-1622920387=:32368"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sat, 05 Jun 2021 21:13:15 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sat, 05 Jun 2021 21:13:07 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] struct type renaming in the absence of certain function
 calls on members
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
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1137960262-1622920387=:32368
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Sat, 5 Jun 2021, Jason A. Donenfeld wrote:

> Hi Julia,
>
> Holy mackerel, that's amazing. Thank you so much! Very fancy embedding
> the ocaml in there, and just using a hash table. Neat idea.
>
> I'm running it (well, a modified version, pasted below) on a codebase
> and finding that it fails to replace the "struct rwlock x" with "struct
> mtx x" in most cases, except one, which is strange. I wonder if it's the
> parser choking on macros it doesn't understand in the code? Or on
> something else?
>
> Code is here, if you're curious:
>
> $ git clone https://git.zx2c4.com/wireguard-freebsd
> $ cd wireguard-freebsd/src
> $ spatch.opt --sp-file doit.cocci -j 4 --recursive-includes --include-headers-for-types --include-headers --in-place .
>
> I'll keep playing with it to see what's happening...

Thanks for the link to the code.  Maybe you need a -I option to tell it
where the header files are?  To check for parsing problems, you can say
spatch --parse-c wireguard-freebsd.  You may need to remove any limit on
the stacksize.

julia

>
> Jason
>
> == doit.cocci ==
>
> virtual after_start
>
> @initialize:ocaml@
> @@
>
> let has_write_table = Hashtbl.create 101
> let has_read_table = Hashtbl.create 101
>
> let ok i m =
>   let entry = (i,m) in
>   Hashtbl.mem has_write_table entry && not(Hashtbl.mem has_read_table entry)
>
> @hasw depends on !after_start@
> identifier i,m;
> struct i x;
> @@
>
> (
> rw_wlock(&x.m)
> |
> rw_wunlock(&x.m)
> )
>
> @script:ocaml@
> i << hasw.i;
> m << hasw.m;
> @@
> Hashtbl.replace has_write_table (i,m) ()
>
> @hasr depends on !after_start@
> identifier i,m;
> struct i x;
> @@
>
> (
> rw_rlock(&x.m)
> |
> rw_runlock(&x.m)
> )
>
> @script:ocaml@
> i << hasr.i;
> m << hasr.m;
> @@
> Hashtbl.replace has_read_table (i,m) ()
>
> @finalize:ocaml depends on !after_start@
> wt << merge.has_write_table;
> rt << merge.has_read_table;
> @@
>
> let redo ts dst =
>   List.iter (Hashtbl.iter (fun k _ -> Hashtbl.add dst k ())) ts in
> redo wt has_write_table;
> redo rt has_read_table;
>
> let it = new iteration() in
> it#add_virtual_rule After_start;
> it#register()
>
> (* ----------------------------------------------------------- *)
>
> @ty2 depends on after_start@
> identifier i;
> identifier m : script:ocaml(i) { ok i m };
> @@
>
> struct i {
>   ...
> - struct rwlock m;
> + struct mtx m;
>   ...
> }
>
> @depends on after_start disable fld_to_ptr@
> identifier m;
> identifier i : script:ocaml(m) { ok i m };
> struct i x;
> @@
>
> - rw_wlock
> + mtx_lock
>    (&x.m)
>
> @depends on after_start disable fld_to_ptr@
> identifier m;
> identifier i : script:ocaml(m) { ok i m };
> struct i x;
> @@
>
> - rw_wunlock
> + mtx_unlock
>    (&x.m)
>
> @depends on after_start disable fld_to_ptr@
> identifier m;
> expression e;
> identifier i : script:ocaml(m) { ok i m };
> struct i x;
> @@
>
> - rw_init(&x.m, e);
> + mtx_init(&x.m, e, NULL, MTX_DEF);
>
> @depends on after_start disable fld_to_ptr@
> identifier m;
> identifier i : script:ocaml(m) { ok i m };
> struct i x;
> @@
>
> - rw_destroy
> + mtx_destroy
>    (&x.m)
>
> @depends on after_start disable fld_to_ptr, ptr_to_array@
> identifier m;
> identifier i : script:ocaml(m) { ok i m };
> struct i *x;
> @@
>
> - rw_wlock
> + mtx_lock
>    (&x->m)
>
> @depends on after_start disable fld_to_ptr, ptr_to_array@
> identifier m;
> identifier i : script:ocaml(m) { ok i m };
> struct i *x;
> @@
>
> - rw_wunlock
> + mtx_unlock
>    (&x->m)
>
> @depends on after_start disable fld_to_ptr, ptr_to_array@
> identifier m;
> expression e;
> identifier i : script:ocaml(m) { ok i m };
> struct i *x;
> @@
>
> - rw_init(&x->m, e);
> + mtx_init(&x->m, e, NULL, MTX_DEF);
>
> @depends on after_start disable fld_to_ptr, ptr_to_array@
> identifier m;
> identifier i : script:ocaml(m) { ok i m };
> struct i *x;
> @@
>
> - rw_destroy
> + mtx_destroy
>    (&x->m)
>
--8323329-1137960262-1622920387=:32368
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-1137960262-1622920387=:32368--
