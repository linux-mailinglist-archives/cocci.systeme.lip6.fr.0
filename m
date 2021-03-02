Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 90745329D2F
	for <lists+cocci@lfdr.de>; Tue,  2 Mar 2021 12:43:09 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 122BgJ5E023765;
	Tue, 2 Mar 2021 12:42:19 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id A3FA077DF;
	Tue,  2 Mar 2021 12:42:19 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id B12525DC3
 for <cocci@systeme.lip6.fr>; Tue,  2 Mar 2021 12:42:17 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 122BgGgd028402
 for <cocci@systeme.lip6.fr>; Tue, 2 Mar 2021 12:42:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614685336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=YUEGwRqVnTgmdEnas0riBppbog6j9ZhhCY2pLDGa34g=;
 b=VyrxgEgNurMW1mdKq2ltNLj0OCQUYzKuoKEoHhmKtDrDoTEu8R79rgwv7v0lzFudi2JeCm
 jD5wXqzu2LMqyOtE5A+kN0+6gZQnXZdh0qPiCqtbEIf9w/WHd7PCsdNcxPJc7xkDqC4NFp
 9BQuEFXvCxsCyHhvFL/7RfJ6Xjjr2BI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-ttcD296FM4OWnWSqsn6epA-1; Tue, 02 Mar 2021 06:42:13 -0500
X-MC-Unique: ttcD296FM4OWnWSqsn6epA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2DA2918BA29E
 for <cocci@systeme.lip6.fr>; Tue,  2 Mar 2021 11:42:12 +0000 (UTC)
Received: from localhost (ovpn-112-87.ams2.redhat.com [10.36.112.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E96F10013C1
 for <cocci@systeme.lip6.fr>; Tue,  2 Mar 2021 11:42:10 +0000 (UTC)
Date: Tue, 2 Mar 2021 11:42:08 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: cocci@systeme.lip6.fr
Message-ID: <20210302114208.GA1818@redhat.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 02 Mar 2021 12:42:36 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Tue, 02 Mar 2021 12:42:17 +0100 (CET)
Subject: [Cocci] A few build failures with OCaml 4.12.0
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
X-Spam-Score: 3.047 (***) BAYES_00,DKIM_INVALID,DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,M_LOTSPARS,SPF_HELO_SOFTFAIL,SPF_SOFTFAIL,URIBL_BLACK
X-Spam-Status: Yes, hits=3.047 required=3
X-Spam-Report: Content analysis details:   (3.0 points, 3.0 required)
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
                0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                                           valid
                0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
               -1.0 M_LOTSPARS             No description available.
               -1.0 MAILING_LIST_MULTI     Multiple indicators imply a widely-seen list
                                           manager
               

ocamlfind ocamlopt -c -package result -package seq -bin-annot -no-alias-deps -I . -alert -deprecated stdcompat__arg_s.mli -o stdcompat__arg_s.cmi
File "stdcompat__arg_s.mli", lines 3-17, characters 0-38:
 3 | type spec = Arg.spec =
 4 |   | Unit of (unit -> unit) 
 5 |   | Bool of (bool -> unit) 
 6 |   | Set of bool ref 
 7 |   | Clear of bool ref 
...
14 |   | Tuple of spec list 
15 |   | Symbol of string list * (string -> unit) 
16 |   | Rest of (string -> unit) 
17 |   | Expand of (string -> string array).
Error: This variant or record definition does not match that of type Arg.spec
       Constructors number 14 have different names, Rest_all and Expand.

There is a new Rest_all constructor:

https://github.com/ocaml/ocaml/blob/500d8dc8296d09305b5413f140c63ffee1de111d/stdlib/arg.mli#L92

----------------------------------------------------------------------

ocamlfind ocamlopt -c -package result -package seq -bin-annot -no-alias-deps -I . -alert -deprecated stdcompat__spacetime_s.mli -o stdcompat__spacetime_s.cmi
File "stdcompat__spacetime_s.mli", line 3, characters 16-32:
3 | module Series = Spacetime.Series
                    ^^^^^^^^^^^^^^^^
Error: Unbound module Spacetime

This module was removed in OCaml commit
540996d21ee3793a1cecce252c81fb76a6b9fd61.

----------------------------------------------------------------------

ocamlfind ocamlc -c -package result -package seq -bin-annot -no-alias-deps -I . -alert -deprecated stdcompat__ephemeron.ml -o stdcompat__ephemeron.cmo
File "stdcompat__ephemeron.ml", line 1:
Error: The implementation stdcompat__ephemeron.ml
       does not match the interface stdcompat__ephemeron.cmi:
       ...
       At position module type S = <here>
       Type declarations do not match:
         type 'a t
       is not included in
         type !'a t
       Their variances do not agree.
       File "hashtbl.mli", line 335, characters 4-14: Expected declaration
       File "stdcompat__ephemeron_s.mli", line 6, characters 4-13:
         Actual declaration

Not sure about this one but AFAICT cocci doesn't use this module.

----------------------------------------------------------------------

I made a patch to workaround the issues in Fedora, but it's a pure hack:

  https://src.fedoraproject.org/rpms/coccinelle/tree/rawhide

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
libguestfs lets you edit virtual machines.  Supports shell scripting,
bindings from many languages.  http://libguestfs.org

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
