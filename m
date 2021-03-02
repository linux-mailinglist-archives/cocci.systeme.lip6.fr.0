Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F31329D76
	for <lists+cocci@lfdr.de>; Tue,  2 Mar 2021 13:00:02 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 122BxIhM003660;
	Tue, 2 Mar 2021 12:59:18 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id AB2E177DF;
	Tue,  2 Mar 2021 12:59:18 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id BBBBB5DC3
 for <cocci@systeme.lip6.fr>; Tue,  2 Mar 2021 12:59:16 +0100 (CET)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 122BxG31018627
 for <cocci@systeme.lip6.fr>; Tue, 2 Mar 2021 12:59:16 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.81,216,1610406000"; d="scan'208";a="374514781"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 12:59:15 +0100
Date: Tue, 2 Mar 2021 12:59:15 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: "Richard W.M. Jones" <rjones@redhat.com>
In-Reply-To: <20210302114208.GA1818@redhat.com>
Message-ID: <alpine.DEB.2.22.394.2103021258130.2906@hadrien>
References: <20210302114208.GA1818@redhat.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 02 Mar 2021 12:59:34 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Tue, 02 Mar 2021 12:59:16 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] A few build failures with OCaml 4.12.0
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
X-Spam-Score: 3.847 (***) BAYES_00,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_SOFTFAIL,SPF_SOFTFAIL,URIBL_BLACK
X-Spam-Status: Yes, hits=3.847 required=3
X-Spam-Report: Content analysis details:   (3.8 points, 3.0 required)
                pts rule name              description
               --- ---------              -----------
                5.1 URIBL_BLACK            Contains an URL listed in the URIBL blacklist
                                           [URIs: rwmj.wordpress.com]
               -1.9 BAYES_00               BODY: Bayes spam probability is 0 to 1%
                                           [score: 0.0000]
                0.7 SPF_HELO_SOFTFAIL      SPF: HELO does not match SPF record (softfail)
                0.7 SPF_SOFTFAIL           SPF: sender does not match SPF record (softfail)
                0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
                                           mail domains are different
               -1.0 MAILING_LIST_MULTI     Multiple indicators imply a widely-seen list
                                           manager
               



On Tue, 2 Mar 2021, Richard W.M. Jones wrote:

> ocamlfind ocamlopt -c -package result -package seq -bin-annot -no-alias-deps -I . -alert -deprecated stdcompat__arg_s.mli -o stdcompat__arg_s.cmi
> File "stdcompat__arg_s.mli", lines 3-17, characters 0-38:
>  3 | type spec = Arg.spec =
>  4 |   | Unit of (unit -> unit)
>  5 |   | Bool of (bool -> unit)
>  6 |   | Set of bool ref
>  7 |   | Clear of bool ref
> ...
> 14 |   | Tuple of spec list
> 15 |   | Symbol of string list * (string -> unit)
> 16 |   | Rest of (string -> unit)
> 17 |   | Expand of (string -> string array).
> Error: This variant or record definition does not match that of type Arg.spec
>        Constructors number 14 have different names, Rest_all and Expand.
>
> There is a new Rest_all constructor:
>
> https://github.com/ocaml/ocaml/blob/500d8dc8296d09305b5413f140c63ffee1de111d/stdlib/arg.mli#L92
>
> ----------------------------------------------------------------------
>
> ocamlfind ocamlopt -c -package result -package seq -bin-annot -no-alias-deps -I . -alert -deprecated stdcompat__spacetime_s.mli -o stdcompat__spacetime_s.cmi
> File "stdcompat__spacetime_s.mli", line 3, characters 16-32:
> 3 | module Series = Spacetime.Series
>                     ^^^^^^^^^^^^^^^^
> Error: Unbound module Spacetime
>
> This module was removed in OCaml commit
> 540996d21ee3793a1cecce252c81fb76a6b9fd61.
>
> ----------------------------------------------------------------------
>
> ocamlfind ocamlc -c -package result -package seq -bin-annot -no-alias-deps -I . -alert -deprecated stdcompat__ephemeron.ml -o stdcompat__ephemeron.cmo
> File "stdcompat__ephemeron.ml", line 1:
> Error: The implementation stdcompat__ephemeron.ml
>        does not match the interface stdcompat__ephemeron.cmi:
>        ...
>        At position module type S = <here>
>        Type declarations do not match:
>          type 'a t
>        is not included in
>          type !'a t
>        Their variances do not agree.
>        File "hashtbl.mli", line 335, characters 4-14: Expected declaration
>        File "stdcompat__ephemeron_s.mli", line 6, characters 4-13:
>          Actual declaration
>
> Not sure about this one but AFAICT cocci doesn't use this module.
>
> ----------------------------------------------------------------------
>
> I made a patch to workaround the issues in Fedora, but it's a pure hack:

Thanks for the feedback and the fix attempt.  I hope that this can be
fixed on our side shortly.

julia


>
>   https://src.fedoraproject.org/rpms/coccinelle/tree/rawhide
>
> Rich.
>
> --
> Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
> Read my programming and virtualization blog: http://rwmj.wordpress.com
> libguestfs lets you edit virtual machines.  Supports shell scripting,
> bindings from many languages.  http://libguestfs.org
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
